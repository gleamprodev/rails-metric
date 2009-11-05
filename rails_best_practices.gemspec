# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rails_best_practices}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richard Huang"]
  s.date = %q{2009-11-05}
  s.default_executable = %q{rails_best_practices}
  s.description = %q{check rails files according to ihower's presentation 'rails best practices'}
  s.email = %q{flyerhzm@gmail.com}
  s.executables = ["rails_best_practices"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.textile"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.textile",
     "Rakefile",
     "VERSION",
     "bin/rails_best_practices",
     "lib/rails_best_practices.rb",
     "lib/rails_best_practices/checks.rb",
     "lib/rails_best_practices/checks/add_model_virtual_attribute_check.rb",
     "lib/rails_best_practices/checks/check.rb",
     "lib/rails_best_practices/checks/many_to_many_collection_check.rb",
     "lib/rails_best_practices/checks/move_finder_to_named_scope_check.rb",
     "lib/rails_best_practices/checks/move_model_logic_into_model_check.rb",
     "lib/rails_best_practices/checks/nested_model_forms_check.rb",
     "lib/rails_best_practices/checks/overuse_route_customizations_check.rb",
     "lib/rails_best_practices/checks/replace_complex_creation_with_factory_method_check.rb",
     "lib/rails_best_practices/checks/use_model_association_check.rb",
     "lib/rails_best_practices/checks/use_model_callback_check.rb",
     "lib/rails_best_practices/checks/use_scope_access_check.rb",
     "lib/rails_best_practices/command.rb",
     "lib/rails_best_practices/core.rb",
     "lib/rails_best_practices/core/checking_visitor.rb",
     "lib/rails_best_practices/core/core_ext.rb",
     "lib/rails_best_practices/core/error.rb",
     "lib/rails_best_practices/core/runner.rb",
     "lib/rails_best_practices/core/visitable_sexp.rb",
     "rails_best_practices.yml",
     "spec/rails_best_practices/checks/add_model_virtual_attribute_check_spec.rb",
     "spec/rails_best_practices/checks/many_to_many_collection_check_spec.rb",
     "spec/rails_best_practices/checks/move_finder_to_named_scope_check_spec.rb",
     "spec/rails_best_practices/checks/move_model_logic_into_model_check_spec.rb",
     "spec/rails_best_practices/checks/nested_model_forms_check_spec.rb",
     "spec/rails_best_practices/checks/overuse_route_customizations_check_spec.rb",
     "spec/rails_best_practices/checks/replace_complex_creation_with_factory_method_check_spec.rb",
     "spec/rails_best_practices/checks/use_model_association_check_spec.rb",
     "spec/rails_best_practices/checks/use_model_callback_check_spec.rb",
     "spec/rails_best_practices/checks/use_scope_access_check_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/flyerhzm/rails_best_practices}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{check rails files according to ihower's presentation 'rails best practices'}
  s.test_files = [
    "spec/rails_best_practices/checks/use_scope_access_check_spec.rb",
     "spec/rails_best_practices/checks/add_model_virtual_attribute_check_spec.rb",
     "spec/rails_best_practices/checks/use_model_callback_check_spec.rb",
     "spec/rails_best_practices/checks/many_to_many_collection_check_spec.rb",
     "spec/rails_best_practices/checks/use_model_association_check_spec.rb",
     "spec/rails_best_practices/checks/move_model_logic_into_model_check_spec.rb",
     "spec/rails_best_practices/checks/replace_complex_creation_with_factory_method_check_spec.rb",
     "spec/rails_best_practices/checks/nested_model_forms_check_spec.rb",
     "spec/rails_best_practices/checks/move_finder_to_named_scope_check_spec.rb",
     "spec/rails_best_practices/checks/overuse_route_customizations_check_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby_parser>, [">= 0"])
      s.add_runtime_dependency(%q<ruby2ruby>, [">= 0"])
    else
      s.add_dependency(%q<ruby_parser>, [">= 0"])
      s.add_dependency(%q<ruby2ruby>, [">= 0"])
    end
  else
    s.add_dependency(%q<ruby_parser>, [">= 0"])
    s.add_dependency(%q<ruby2ruby>, [">= 0"])
  end
end

