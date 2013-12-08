<%@ page import="au.org.ala.fieldcapture.SettingPageType" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
  <meta name="layout" content="${grailsApplication.config.layout.skin?:'main'}"/>
  <title>${settingType.title?:'About'} | Field Capture</title>
  <r:script disposition="head">
    var fcConfig = {
        baseUrl: "${grailsApplication.config.grails.serverURL}",
        spatialBaseUrl: "${grailsApplication.config.spatial.baseURL}",
        spatialWmsCacheUrl: "${grailsApplication.config.spatial.wms.cache.url}",
        spatialWmsUrl: "${grailsApplication.config.spatial.wms.url}",
        sldPolgonDefaultUrl: "${grailsApplication.config.sld.polgon.default.url}",
        sldPolgonHighlightUrl: "${grailsApplication.config.sld.polgon.highlight.url}"
    }
  </r:script>
</head>
<body>
    <div id="wrapper" class="container-fluid">
        <div class="row-fluid">
            <div class="span8" id="">
                <h1>${settingType.title?:'About the website'}
                    <g:if test="${fc.userIsSiteAdmin()}">
                        <span style="display: inline-block; margin: 0 10px;">
                            <a href="${g.createLink(controller:"admin",action:"editSettingText", id: settingType.name, params: [layout:"nrm",returnUrl: g.createLink(controller: params.controller, action: params.action, absolute: true)])}"
                               class="btn btn-small"><i class="icon-edit"></i> Edit</a>
                        </span>
                    </g:if>
                </h1>
            </div>
        </div>
        <div class="row-fluid">
            <div class="span8">
                <div class="" id="aboutDescription" style="margin-top:20px;">
                    <markdown:renderHtml>${content}</markdown:renderHtml>
                </div>
            </div><!-- /.spanN  -->
            <g:if test="${settingType == SettingPageType.ABOUT && fc.userIsLoggedIn()}">
                <div class="span4 well well-small">
                    <fc:getSettingContent settingType="${SettingPageType.INTRO}"/>
                </div>
            </g:if>
        </div><!-- /.row-fluid  -->
    </div>
</body>
</html>