$.validator.unobtrusive.adapters.add(
'captcha', ['guid'], function (options) {
    options.rules['captcha'] = options.params;
    options.messages['captcha'] = options.message;
});

$.validator.addMethod("captcha", function (value, element, params) {
    console.log(params.guid);
    return false;
},'');