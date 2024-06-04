import xml.etree.ElementTree as ET

OVAL_DEF = "{http://oval.mitre.org/XMLSchema/oval-definitions-5}"
LINUX = "{http://oval.mitre.org/XMLSchema/oval-definitions-5#linux}"
CPE_LANG = "{http://cpe.mitre.org/language/2.0}"
DC = "{http://purl.org/dc/elements/1.1/}"

tree = ET.parse('ssg-gentoo-ds.xml')
root = tree.getroot()

# Remove <linux:rpminfo_test> tag from datastream collection
for tests in root.iter(OVAL_DEF+'tests'):
	for rpminfo_test in tests.findall(LINUX+'rpminfo_test'):
		id = rpminfo_test.attrib['id']
		tests.remove(rpminfo_test)

		# Remove the reference to the test also
		for definition in root.iter(OVAL_DEF+'definition'):
			for criteria in definition.findall(OVAL_DEF+'criteria'):
				for criterion in criteria.findall(OVAL_DEF+'criterion'):
					if criterion.attrib['test_ref'] == id:
						definition.remove(criteria)

# Remove <cpe-lang:logica-test> tag to make the test applicable on gentoo
for logical_test in root.iter(CPE_LANG+'logical-test'):
	for check_fact_ref in logical_test.findall(CPE_LANG+'check-fact-ref'):
		logical_test.remove(check_fact_ref)

for metadata in root.iter(OVAL_DEF+'metadata'):
	for contributor in metadata.findall(DC+'contributor'):
		metadata.remove(contributor)

# Substitute the datastream collection
tree.write('ssg-gentoo-ds.xml')

with open(r'ssg-gentoo-ds.xml', 'r') as file:
	data = file.read()
	data = data.replace("/etc/bashrc","/etc/bash/bashrc")

with open(r'ssg-gentoo-ds.xml', 'w') as file:
	file.write(data)
