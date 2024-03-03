# 所有GUI组件的基类
extends CanvasItem;
class_name BaseGUIComponent;

# 在被唤醒显示在屏幕上时的行为（组件动画之类的应该被填在这里）
func wake():
    pass;

# 在沉睡是显示在屏幕上的行为
func sleep():
    pass;