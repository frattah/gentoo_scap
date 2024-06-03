file(REMOVE_RECURSE
  "../bash/all-profile-bash-scripts-gentoo"
  "../ssg-gentoo-cpe-dictionary.xml"
  "../ssg-gentoo-cpe-oval.xml"
  "../ssg-gentoo-ds.xml"
  "../ssg-gentoo-ocil.xml"
  "../ssg-gentoo-oval.xml"
  "../ssg-gentoo-xccdf.xml"
  "CMakeFiles/gentoo-profile-bash-scripts"
  "checks/sce/metadata.json"
  "collect-remediations-gentoo"
  "cpe-oval-unlinked.xml"
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
  include(CMakeFiles/gentoo-profile-bash-scripts.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
