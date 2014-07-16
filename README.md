kbengine_unity3d_warring
=============

##服务端引擎:
http://www.kbengine.org

## QQ交流群
	群1: 16535321 
	群2: 367555003


##GO!
	更新kbengine插件库(https://github.com/kbengine/kbengine_unity3d_plugins):
		* 使用git命令行，进入到kbengine_unity3d_warring目录执行: 
			git submodule update --init

		* 或者使用 TortoiseGit(选择菜单): TortoiseGit -> Submodule Update:
![submodule_update](http://www.kbengine.org/assets/img/screenshots/unity3d_plugins_submodule_update.jpg)

	创建AssetBundles
		unity3d(菜单上)->Publish->Build Pulish AssetBundles - autoAll

		期间可能一直出现"Moving file failed"， 需要点击"try again"让其继续, 
		这可能是unity3d在移动文件时文件被占用造成的。
		执行完毕后检查 Assets->StreamingAssets是否有内容。

	生成服务端寻路数据:
		先将Assets\Plugins\cai-nmgen-rcn(generate navmesh).zip解压放当前目录下并重启unity3d编辑器, 然后执行如下步骤:
			unity3d资源浏览器中选中: Assets->Nav_build->xinshoucun->NavmeshBuild->Build & Bake, 等待生成完成之后
			unity3d资源浏览器中选中: Assets->Nav_build->xinshoucun->CAIBakedNavmesh->Save, 将其中srv_xxx.navmesh放到服务端kbengine\demo\res\spaces\xinshoucun中
		生成完毕后建议删除cai-nmgen-rcn(generate navmesh).zip解压出来的文件，会造成无法导出游戏的错误，原因未知。

	测试是否可运行:
		先开启服务端，unity3d中选择Assets\scenes\go场景然后点击编辑器运行按钮，如果无意外应该可以登录游戏进入到场景中了。

##导出WebPlayer项目:

	unity3d File->Build Settings->Scenes In Build选择scenes/go.unity->Platform
	选择Web Player->Build。 


##在浏览器运行游戏:

	Web服务器部署文件夹结构:

		->(服务器根目录)
			- StreamingAssets (创建AssetBundles生成的文件夹)
			- ui (Assets下的ui文件夹可以直接拷贝过来)
			- crossdomain.xml
			- initLogo.png
			- initProgressBar.PNG
			- initProgressFrame.PNG
			- index.html
			- Unity3d.unity3d (在unity3d编译时生成的文件)
			- Unity3d.html (在unity3d编译时生成的文件)

	1. 启动kbengine服务端

	2. 浏览器访问localhost
	如不清楚请下载发布版demo， 并按照其中的文件夹结构放置并看压缩包内文档教程如何启动:
	https://sourceforge.net/projects/kbengine/files/


##日志:

	Windows XP: C:\Documents and Settings\username\Local  Settings\Temp\UnityWebPlayer\log
	Windows Vista/7: C:\Users\username\AppData\Local\Temp\UnityWebPlayer\log

##warring截图
![warring项目运行效果](http://www.kbengine.org/assets/img/screenshots/unity3d_demo1.jpg)
![warring项目运行效果](http://www.kbengine.org/assets/img/screenshots/unity3d_demo2.jpg)
![warring项目运行效果](http://www.kbengine.org/assets/img/screenshots/unity3d_demo3.jpg)
![warring项目运行效果](http://www.kbengine.org/assets/img/screenshots/unity3d_demo4.jpg)
![warring项目运行效果](http://www.kbengine.org/assets/img/screenshots/unity3d_demo5.jpg)
![warring项目运行效果](http://www.kbengine.org/assets/img/screenshots/unity3d_demo6.jpg)
![warring项目运行效果](http://www.kbengine.org/assets/img/screenshots/unity3d_demo33.jpg)
