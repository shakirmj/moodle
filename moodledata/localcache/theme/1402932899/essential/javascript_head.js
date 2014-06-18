YUI.add('moodle-theme_essential-coloursswitcher',function(Y){var SCHEMES=['default','alternative1','alternative2','alternative3'],ColoursSwitcher=function(){ColoursSwitcher.superclass.constructor.apply(this,arguments)};ColoursSwitcher.prototype={initializer:function(config){var i,s;for(i in SCHEMES){s=SCHEMES[i];if(Y.one(document.body).hasClass('essential-colours-'+s))this.set('scheme',s);Y.all(config.div+' .colours-'+s).each(function(node){node.ancestor().on('click',this.setScheme,this,s)},this)}},setScheme:function(e,scheme){e.preventDefault();var prefix='essential-colours-';Y.one(document.body).replaceClass(prefix+this.get('scheme'),prefix+scheme);this.set('scheme',scheme);M.util.set_user_preference('theme_essential_colours',scheme)}};Y.extend(ColoursSwitcher,Y.Base,ColoursSwitcher.prototype,{NAME:'Essential theme colours scheme switcher',ATTRS:{scheme:{value:'default'}}});M.theme_essential=M.theme_essential||{};M.theme_essential.initColoursSwitcher=function(cfg){return new ColoursSwitcher(cfg)}},'@VERSION@',{requires:['base','node']})