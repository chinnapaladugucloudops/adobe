provider "github" {
  organization = "wezvatechnologies"
}

data "github_repository" "example" {
  full_name = "scmlearningcentre/maven"
}

data "github_repositories" "example" {
   query = "scmlearningcentre/is:public"
}

output "repolist" {
    value = "${data.github_repositories.example.full_names}"
}
