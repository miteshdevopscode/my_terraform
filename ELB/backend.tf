terraform {
  backend  "s3" {
    bucket = "tfstate2019"
    key = "tfstates/myterraform-remote-states-for-asg"
    region = "us-east-1"
    profile = "default"

}


}
