// 去掉字符串首尾的空格
String.prototype.trim = function() {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

// 判断字符串是否为空
function isBlank(str){
	str = str.trim();
	if(!str)
		return true;
	else
		return false;
}