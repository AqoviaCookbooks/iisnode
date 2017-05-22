name 'iisnode'
maintainer 'AqoviaCookbooks'
maintainer_email 'info@aqovia.com'
source_url       'https://github.com/AqoviaCookbooks/iisnode'
issues_url       'https://github.com/AqoviaCookbooks/iisnode/issues'
license 'MIT'
description 'Installs/Configures iisnode'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.3'

supports 'windows'

depends 'iis_urlrewrite'
depends 'nodejs'

chef_version '>= 12.6' if respond_to?(:chef_version)
