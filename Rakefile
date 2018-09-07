require 'html-proofer'

task :test do
  sh "bundle exec jekyll build"
  options = { :assume_extension => true,
    :empty_alt_ignore => true, 
    :url_ignore => [/feed.xml/, "#", /teams.fhcrc.org/, 
                    /toolbox.fhcrc.org/, /galaxy.fredhutch.org/,
                    /rstudio.fhcrc.org/, /jupyterhub.fhcrc.org/,
                    /aspera.fhcrc.org/, /mydb.fredhutch.org/,
                    /translationalgenomics.fredhutch.org/,
                    /lists.fhcrc.org/]}
  HTMLProofer.check_directory("./_site", options).run
end
