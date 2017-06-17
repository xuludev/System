function checkPassword(c1,
	clientInformation) {
	if (c1.eval(c2)) {
		alert('您输入的密码不一致');
	}
}

function openFileIIs(filename) {
	try {
		var obj = new ActiveXObject("wscript.shell");
		if (obj) {
			obj.Run("\"" + filename + "\"", 1, false);
			//obj.run("osk");/*打开屏幕键盘*/  
			//obj.Run('"'+filename+'"');   
			obj = null;
		}
	} catch (e) {
		alert("请确定是否存在该盘符或文件");
	}

}