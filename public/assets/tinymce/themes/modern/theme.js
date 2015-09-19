tinymce.ThemeManager.add("modern",function(a){function b(){function b(b){var d,e=[];if(b)return l(b.split(/[ ,]/),function(b){function c(){var c=a.selection;"bullist"==f&&c.selectorChanged("ul > li",function(a,c){for(var d,e=c.parents.length;e--&&(d=c.parents[e].nodeName,"OL"!=d&&"UL"!=d););b.active(a&&"UL"==d)}),"numlist"==f&&c.selectorChanged("ol > li",function(a,c){for(var d,e=c.parents.length;e--&&(d=c.parents[e].nodeName,"OL"!=d&&"UL"!=d););b.active(a&&"OL"==d)}),b.settings.stateSelector&&c.selectorChanged(b.settings.stateSelector,function(a){b.active(a)},!0),b.settings.disabledStateSelector&&c.selectorChanged(b.settings.disabledStateSelector,function(a){b.disabled(a)})}var f;"|"==b?d=null:k.has(b)?(b={type:b},j.toolbar_items_size&&(b.size=j.toolbar_items_size),e.push(b),d=null):(d||(d={type:"buttongroup",items:[]},e.push(d)),a.buttons[b]&&(f=b,b=a.buttons[f],"function"==typeof b&&(b=b()),b.type=b.type||"button",j.toolbar_items_size&&(b.size=j.toolbar_items_size),b=k.create(b),d.items.push(b),a.initialized?c():a.on("init",c)))}),c.push({type:"toolbar",layout:"flow",items:e}),!0}var c=[];if(tinymce.isArray(j.toolbar)){if(0===j.toolbar.length)return;tinymce.each(j.toolbar,function(a,b){j["toolbar"+(b+1)]=a}),delete j.toolbar}for(var d=1;10>d&&b(j["toolbar"+d]);d++);return c.length||j.toolbar===!1||b(j.toolbar||o),c.length?{type:"panel",layout:"stack",classes:"toolbar-grp",ariaRoot:!0,ariaRemember:!0,items:c}:void 0}function c(){function b(b){var c;return"|"==b?{text:"|"}:c=a.menuItems[b]}function c(c){var d,e,f,g,h;if(h=tinymce.makeMap((j.removed_menuitems||"").split(/[ ,]/)),j.menu?(e=j.menu[c],g=!0):e=n[c],e){d={text:e.title},f=[],l((e.items||"").split(/[ ,]/),function(a){var c=b(a);c&&!h[a]&&f.push(b(a))}),g||l(a.menuItems,function(a){a.context==c&&("before"==a.separator&&f.push({text:"|"}),a.prependToContext?f.unshift(a):f.push(a),"after"==a.separator&&f.push({text:"|"}))});for(var i=0;i<f.length;i++)"|"==f[i].text&&(0===i||i==f.length-1)&&f.splice(i,1);if(d.menu=f,!d.menu.length)return null}return d}var d,e=[],f=[];if(j.menu)for(d in j.menu)f.push(d);else for(d in n)f.push(d);for(var g="string"==typeof j.menubar?j.menubar.split(/[ ,]/):f,h=0;h<g.length;h++){var i=g[h];i=c(i),i&&e.push(i)}return e}function d(b){function c(a){var c=b.find(a)[0];c&&c.focus(!0)}a.shortcuts.add("Alt+F9","",function(){c("menubar")}),a.shortcuts.add("Alt+F10","",function(){c("toolbar")}),a.shortcuts.add("Alt+F11","",function(){c("elementpath")}),b.on("cancel",function(){a.focus()})}function e(b,c){function d(a){return{width:a.clientWidth,height:a.clientHeight}}var e,f,g,h;e=a.getContainer(),f=a.getContentAreaContainer().firstChild,g=d(e),h=d(f),null!==b&&(b=Math.max(j.min_width||100,b),b=Math.min(j.max_width||65535,b),m.setStyle(e,"width",b+(g.width-h.width)),m.setStyle(f,"width",b)),c=Math.max(j.min_height||100,c),c=Math.min(j.max_height||65535,c),m.setStyle(f,"height",c),a.fire("ResizeEditor")}function f(b,c){var d=a.getContentAreaContainer();i.resizeTo(d.clientWidth+b,d.clientHeight+c)}function g(e){function f(){if(n&&n.moveRel&&n.visible()&&!n._fixed){var b=a.selection.getScrollContainer(),c=a.getBody(),d=0,e=0;if(b){var f=m.getPos(c),g=m.getPos(b);d=Math.max(0,g.x-f.x),e=Math.max(0,g.y-f.y)}n.fixed(!1).moveRel(c,a.rtl?["tr-br","br-tr"]:["tl-bl","bl-tl","tr-br"]).moveBy(d,e)}}function g(){n&&(n.show(),f(),m.addClass(a.getBody(),"mce-edit-focus"))}function h(){n&&(n.hide(),m.removeClass(a.getBody(),"mce-edit-focus"))}function l(){return n?void(n.visible()||g()):(n=i.panel=k.create({type:o?"panel":"floatpanel",role:"application",classes:"tinymce tinymce-inline",layout:"flex",direction:"column",align:"stretch",autohide:!1,autofix:!0,fixed:!!o,border:1,items:[j.menubar===!1?null:{type:"menubar",border:"0 0 1 0",items:c()},b()]}),a.fire("BeforeRenderUI"),n.renderTo(o||document.body).reflow(),d(n),g(),a.on("nodeChange",f),a.on("activate",g),a.on("deactivate",h),void a.nodeChanged())}var n,o;return j.fixed_toolbar_container&&(o=m.select(j.fixed_toolbar_container)[0]),j.content_editable=!0,a.on("focus",function(){e.skinUiCss?tinymce.DOM.styleSheetLoader.load(e.skinUiCss,l,l):l()}),a.on("blur hide",h),a.on("remove",function(){n&&(n.remove(),n=null)}),e.skinUiCss&&tinymce.DOM.styleSheetLoader.load(e.skinUiCss),{}}function h(f){var g,h,l;return f.skinUiCss&&tinymce.DOM.loadCSS(f.skinUiCss),g=i.panel=k.create({type:"panel",role:"application",classes:"tinymce",style:"visibility: hidden",layout:"stack",border:1,items:[j.menubar===!1?null:{type:"menubar",border:"0 0 1 0",items:c()},b(),{type:"panel",name:"iframe",layout:"stack",classes:"edit-area",html:"",border:"1 0 0 0"}]}),j.resize!==!1&&(h={type:"resizehandle",direction:j.resize,onResizeStart:function(){var b=a.getContentAreaContainer().firstChild;l={width:b.clientWidth,height:b.clientHeight}},onResize:function(a){"both"==j.resize?e(l.width+a.deltaX,l.height+a.deltaY):e(null,l.height+a.deltaY)}}),j.statusbar!==!1&&g.add({type:"panel",name:"statusbar",classes:"statusbar",layout:"flow",border:"1 0 0 0",ariaRoot:!0,items:[{type:"elementpath"},h]}),j.readonly&&g.find("*").disabled(!0),a.fire("BeforeRenderUI"),g.renderBefore(f.targetNode).reflow(),j.width&&tinymce.DOM.setStyle(g.getEl(),"width",j.width),a.on("remove",function(){g.remove(),g=null}),d(g),{iframeContainer:g.find("#iframe")[0].getEl(),editorContainer:g.getEl()}}var i=this,j=a.settings,k=tinymce.ui.Factory,l=tinymce.each,m=tinymce.DOM,n={file:{title:"File",items:"newdocument"},edit:{title:"Edit",items:"undo redo | cut copy paste pastetext | selectall"},insert:{title:"Insert",items:"|"},view:{title:"View",items:"visualaid |"},format:{title:"Format",items:"bold italic underline strikethrough superscript subscript | formats | removeformat"},table:{title:"Table"},tools:{title:"Tools"}},o="undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image";i.renderUI=function(b){var c=j.skin!==!1?j.skin||"lightgray":!1;if(c){var d=j.skin_url;d=d?a.documentBaseURI.toAbsolute(d):tinymce.baseURL+"/skins/"+c,tinymce.Env.documentMode<=7?b.skinUiCss=d+"/skin.ie7.min.css":b.skinUiCss=d+"/skin.min.css",a.contentCSS.push(d+"/content"+(a.inline?".inline":"")+".min.css")}return a.on("ProgressState",function(a){i.throbber=i.throbber||new tinymce.ui.Throbber(i.panel.getEl("body")),a.state?i.throbber.show(a.time):i.throbber.hide()}),j.inline?g(b):h(b)},i.resizeTo=e,i.resizeBy=f});