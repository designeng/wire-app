# "extended" loaded on the reason of the need for extensions to the basic objects

define [
    "marionette"
], (Marionette) ->

    beforeEach -> 

        # --------------------- all Marionette necessary functions ---------------------
        # code from core/overridden
        Marionette.TemplateCache::loadTemplate = (templateId) ->
            template = templateId
            if not template or template.length is 0
                template = " "                 
            template

