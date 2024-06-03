file(REMOVE_RECURSE
  "CMakeFiles/generate-gentoo-xccdf-oval-ocil"
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
  include(CMakeFiles/generate-gentoo-xccdf-oval-ocil.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
