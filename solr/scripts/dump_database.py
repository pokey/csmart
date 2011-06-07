#!/usr/bin/python
import os
os.environ['DJANGO_SETTINGS_MODULE'] = 'csmart_site.settings'
import sys
sys.path.append('/afs/cs.stanford.edu/u/bipins/scratch1/csmart/')
sys.path.append('/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site/')
from resources.models import Resource
from django.contrib.comments.models import Comment
from django.utils.encoding import smart_str, smart_unicode
import xml.dom.minidom
import commands
from urllib2 import *
import re


DIR =  '/afs/cs.stanford.edu/u/bipins/scratch1/csmart/csmart_site/solr/scripts/'

def createSolrXMLDocument():

	myxml = xml.dom.minidom.Document()
	e = myxml.createElement("add")
	myxml.appendChild(e)
	
	return (e, myxml)


def createFieldElement(myxml, name, value):
	f = myxml.createElement("field")
	f.setAttribute("name", name)
	if value:
		t = myxml.createTextNode(smart_str(value))
		f.appendChild(t)
	return f

def main():

	# first create inital Solr XML document
	(add, myxml) = createSolrXMLDocument()

	resourceObjects = Resource.objects.all()

	for r in resourceObjects:


		if r.is_document:

			print 'Processing URL ' + r.url + ' ...',
			
			# add one resource at a time
			doc = myxml.createElement("doc")
			
			id		= createFieldElement(myxml, "id", r.id)
			url		= createFieldElement(myxml, "url", r.url)
			author 		= createFieldElement(myxml, "author", r.author)
			description 	= createFieldElement(myxml, "description", r.description)
			name		= createFieldElement(myxml, "name", r.name)
			topics		= createFieldElement(myxml, "topics", r.topics)

			doc.appendChild(id)
			doc.appendChild(url)
			doc.appendChild(name)
			doc.appendChild(description)
			doc.appendChild(author)
			doc.appendChild(topics)

			# add (possibly multivalued) type field
			for (id, type) in r.resource_type.values_list():
				t = createFieldElement(myxml, "resource_type", type)
				doc.appendChild(t)

			# extract and add comments
			comments = Comment.objects.for_model(Resource).filter(object_pk=r.pk)
			for comment in comments.values():
				c = createFieldElement(myxml, "comment", comment["comment"])
				doc.appendChild(c)

			# download and parse document with Tika
			try:
				# download
				conn = urlopen(r.url)				
				content = conn.read()
				f = open('/tmp/csmart.doc.content', 'w')
				f.write(content)
				f.close()

				# parse for content
				(status, proc) = commands.getstatusoutput('java -jar ' + DIR + 'tika-app-0.9.jar -t /tmp/csmart.doc.content > /tmp/csmart.doc.txt')

				if (status == 0):
					# create xml node
					f = open('/tmp/csmart.doc.txt', 'r')
					body = f.read()
					f.close()
					body = body.replace(os.linesep, ' ')

					c = createFieldElement(myxml, "content", body)
					doc.appendChild(c)
				else:
					print "Tika return non-zero status: " + str(status) + " (" + str(proc) + ")"

			except Exception, e:
				print 'NOT OK: ',
				print e

		add.appendChild(doc)
		print 'ok'

	myxml.writexml(open("/tmp/csmart.solrdoc.xml", "w"))


	return 0;






def resourceTypeSQL():

	resourceTypeSQL = '''
		use csmart;
		select resourceid, group_concat(type.name) from 
		(
			select resource.id as resourceid, mapper.resourcetype_id as resourcetypeid
			from resources_resource as resource, resources_resource_resource_type as mapper 
			where resource.id=mapper.resource_id 
		) mapped, resource_types_resourcetype as type
		where resourcetypeid = type.id
		group by resourceid
		;
	'''
	print resourceTypeSQL



if __name__ == "__main__":
	sys.exit(main())
