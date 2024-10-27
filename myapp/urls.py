from django.contrib import admin
from django.urls import path, include

from myapp import views

urlpatterns = [
   path('',views.login,name='login'),
   path('login_post', views.login_post, name='login_post'),
   
   
   path('logout', views.logout, name='logout'),
   
   
   path('adminhome', views.adminhome, name='adminhome'),
   path('viewallreport',views.viewallreport,name="viewallreport"),
   
   path('viewstudent',views.viewstudent,name='viewstudent'),
   path('block_user/<id>',views.block_user,name='block_user'),
   path('unblock_user/<id>',views.unblock_user,name='unblock_user'),
   
   path('viewteacher',views.viewteacher,name='viewteacher'),
   path('viewteachersearch', views.viewteachersearch, name='viewteachersearch'),
   path('unblock_teacher/<id>',views.unblock_teacher,name='unblock_teacher'),
   path('block_teacher/<id>',views.block_teacher,name='block_teacher'),
   
   
   path('addacounsilor', views.addacounsilor, name='addacounsilor'),
   path('addcounsilor_post', views.addcounsilor_post, name='addcounsilor_post'),
   path('adminviewacounsilors',views.adminviewacounsilors,name='adminviewacounsilors'),
   path('unblock_counsilor/<id>',views.unblock_counsilor,name='unblock_counsilor'),
   path('block_counsilor/<id>',views.block_counsilor,name='block_counsilor'),
   
   path('unblock_ac/<int:id>', views.unblock_ac, name='unblock_ac'),
   
   path('adminviewfeedback',views.adminviewfeedback,name='adminviewfeedback'),
   
   
   
   
   
   
   
   path('studetregister', views.studetregister, name='studetregister'),
   path('studetregister_post', views.studetregister_post, name='studetregister_post'),
   path('studenthome', views.studenthome, name='studenthome'),
   path('viewacounsilor', views.viewacounsilor, name='viewacounsilor'),
   path('sendreport/<cid>',views.sendreport,name='sendreport'),
   path('sendreport_post',views.sendreport_post,name='sendreport_post'),
   path('viewreport',views.viewreport,name='viewreport'),
   path('addfeedback', views.addfeedback, name='addfeedback'),
   path('addfeedback_post', views.addfeedback_post, name='addfeedback_post'),
  
   
   
   
   
   
   
   
   path('teacherregister', views.teacherregister, name='teacherregister'),
   path('teacherregister_post', views.teacherregister_post, name='teacherregister_post'),
   path('teacherhome',views.teacherhome,name='teacherhome'),
   path('teacher_view_report',views.teacher_view_report,name='teacher_view_report'),
   path('teacher_accept_counsilorreply/<id>',views.teacher_accept_counsilorreply,name='teacher_accept_counsilorreply'),
   path('teacher_reject_counsilorreply/<id>',views.teacher_reject_counsilorreply,name='teacher_reject_counsilorreply'),
   
   
   
   
   
   path('counsilorhome',views.counsilorhome,name='counsilorhome'),
   path('counsilorviewreport', views.counsilorviewreport, name='counsilorviewreport'),
   path('sendreportreply/<rid>', views.sendreportreply, name='sendreportreply'),
   path('sendreportreply_post', views.sendreportreply_post, name='sendreportreply_post'),
   path('forward_to_actionboard/<int:rid>/', views.forward_to_actionboard, name='forward_to_actionboard'),
   path('chooseactionboard/<int:id>',views.chooseactionboard,name='chooseactionboard'),
   path('assignactionboard_post', views.assignactionboard_post, name='assignactionboard_post'),
   
   
  
   
   
   
   
   path('actionboard',views.actionboard,name='actionboard'),
   path('actionboardregister',views.actionboardregister,name='actionboardregister'),
   path('actionboardregister_post',views.actionboardregister_post,name='actionboardregister_post'),
   path('action_board_view_report',views.action_board_view_report,name='action_board_view_report'),
   path('action_board_sendreportreply/<rid>',views.action_board_sendreportreply,name='action_board_sendreportreply'),
   path('action_board_sendreportreply_post',views.action_board_sendreportreply_post,name='action_board_sendreportreply_post'),
   
   
   
   
   

]