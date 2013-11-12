for(var i = 0; i < 10; i++) { var scriptId = 'u' + i; window[scriptId] = document.getElementById(scriptId); }

$axure.eventManager.pageLoad(
function (e) {

});

u7.style.cursor = 'pointer';
$axure.eventManager.click('u7', function(e) {

if (true) {

	self.location.href=$axure.globalVariableProvider.getLinkUrl('列表_4.html');

}
});
gv_vAlignTable['u0'] = 'top';gv_vAlignTable['u2'] = 'top';gv_vAlignTable['u3'] = 'top';