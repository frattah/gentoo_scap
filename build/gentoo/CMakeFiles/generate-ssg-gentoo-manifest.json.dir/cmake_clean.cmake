file(REMOVE_RECURSE
  "../ssg-gentoo-cpe-dictionary.xml"
  "../ssg-gentoo-cpe-oval.xml"
  "../ssg-gentoo-ds.xml"
  "../ssg-gentoo-ocil.xml"
  "../ssg-gentoo-oval.xml"
  "../ssg-gentoo-xccdf.xml"
  "CMakeFiles/generate-ssg-gentoo-manifest.json"
  "checks/sce/metadata.json"
  "collect-remediations-gentoo"
  "cpe-oval-unlinked.xml"
  "manifest-gentoo.json"
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
  include(CMakeFiles/generate-ssg-gentoo-manifest.json.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()