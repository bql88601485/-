require('UIAlertView');
defineClass('HomeVC', {
            setupRootView: function() {
            
            self.setupViewNavigationBar();
            
            self.generRootViews();
            
            var aler = UIAlertView.alloc().initWithTitle_message_delegate_cancelButtonTitle_otherButtonTitles("text", "JP 执行了 赞", self, "ok", "ok", null);
            //aler.show();
            },
            });