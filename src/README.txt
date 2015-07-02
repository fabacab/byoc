This directory provides the source "code" and initial virtual machine images
that can be used to automatically create new BYOC-like apps. It is provided
here so that contributions can be upstreamed to the Vagrant base box images.

To create your own BYOC-like virtual environment, edit the supplied variable
sample file(s). You will likely need to edit `atlas-variables.json.sample`,
copying it to `atlas-variables.json` and inserting your own Atlas username
and authentication token. You will also need Packer v0.8.0 or later.

To create an Atlas authentication token, visit

    https://atlas.hashicorp.com/settings/tokens

Packer can be obtained from https://packer.io. Once installed, create your
customized base box like this:

    packer build \
      -var-file=atlas-variables.json \
      -var-file=box-variables.json \
      template.json

This will automatically package the files in this directory into a Vagrant
base box and upload it to Atlas.

Changes you make to the `Vagrantfile` file in this directory will thus be
propagated to all users of the new base box, whereas changes to the parent
directory's `Vagrantfile` file will only be applied if the end-user has
checked out this repository from source control. In other words, the files
in this directory are for DISTRUBUTION, whereas the files in the parent
directory are for customizing development environments.
