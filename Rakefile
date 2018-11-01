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
                    /lists.fhcrc.org/, /slack.com/,
                    /ontology.fredhutch.org/, /biocontainers.pro/,
                    /hutchbase.fhcrc.org/],
      :typhoeus => {:connecttimeout => 30, :timeout => 60}}
  HTMLProofer.check_directory("./_site", options).run
end

task :testlocal do
  sh "bundle exec jekyll build"
  options = { :assume_extension => true,
    :empty_alt_ignore => true, 
    # still excluding internal URLs that require authentication
    :url_ignore => [/teams.fhcrc.org/, /feed.xml/, "#", /slack.com/,
                    /sw2srv/]}
  HTMLProofer.check_directory("./_site", options).run
end
