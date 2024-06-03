file(REMOVE_RECURSE
  "../ssg-gentoo-xccdf.xml"
  "CMakeFiles/generate-ssg-gentoo-xccdf.xml"
  "checks/sce/metadata.json"
  "collect-remediations-gentoo"
  "oval-unlinked.xml"
  "product.yml"
  "ssg-gentoo-ocil.xml"
  "ssg-gentoo-oval.xml"
  "ssg-gentoo-xccdf.xml"
  "ssg_build_compile_all-gentoo"
  "templated-content-gentoo"
)

# Per-language clean rules from dependency scanning.
foreach(lang )
  include(CMakeFiles/generate-ssg-gentoo-xccdf.xml.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
