#!/usr/bin/python

###############################
# This is an example script
###############################

import web

PREFIX = "bin"

urls = (
  '/' + PREFIX + '/example', 'dynexample',
  )

class index:
  def GET(self):
    return "This data is generated dynamically"

if __name__=='__main__':
  app = web.application(urls, globals())
  app.run()
