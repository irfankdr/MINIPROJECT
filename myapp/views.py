import datetime

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.db.models import Q
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from myapp.models import login_table, student_table, registration_table, counsilor_table, feedback_table, report_table, \
    teacher_table



def login(request):
    return render(request,'index.html')
def login_post(request):
    username=request.POST['username']
    password=request.POST['password']
    try:
        user=login_table.objects.filter(username=username,password=password)
        if user:
            ob=login_table.objects.get(username=username,password=password)
            if ob.type=='admin':
                ob1=auth.authenticate(username="admin",password="admin")
                if ob1 is not None:
                    auth.login(request,ob1)
                return HttpResponse('''<script>alert('Admin login succesfully');window.location='adminhome';</script>''')
            elif ob.type=='student':
                request.session['lid'] = ob.id
                ob1 = auth.authenticate(username="admin", password="admin")
                if ob1 is not None:
                    auth.login(request, ob1)
                return HttpResponse('''<script>alert('student login succesfully');window.location='studenthome';</script>''')
            elif ob.type=='teacher':
                request.session['lid'] = ob.id
                ob1 = auth.authenticate(username="admin", password="admin")
                if ob1 is not None:
                    auth.login(request, ob1)
                return HttpResponse('''<script>alert('teacher login succesfully');window.location='teacherhome';</script>''')
            elif ob.type=='counsilor':
                request.session['lid'] = ob.id
                ob1 = auth.authenticate(username="admin", password="admin")
                if ob1 is not None:
                    auth.login(request, ob1)
                return HttpResponse('''<script>alert('counsilor login succesfully');window.location='counsilorhome';</script>''')
            elif ob.type=='actionboard':
                ob1 = auth.authenticate(username="admin", password="admin")
                if ob1 is not None:
                    auth.login(request, ob1)
                request.session['lid'] = ob.id
                return HttpResponse('''<script>alert('Ab login succesfully');window.location='actionboard';</script>''')
            else:
                return HttpResponse('''<script>alert('Invalid credential');window.location='/';</script>''')
        else:
            return HttpResponse('''<script>alert('Invalid credential');window.location='/';</script>''')
    except:
        return HttpResponse('''<script>alert('Invalid credential');window.location='/';</script>''')

def logout(request):
    auth.logout(request)
    return render(request,'index.html')








@login_required(login_url='/')
def adminhome(request):
    feedback=feedback_table.objects.all()
    feedback_count=feedback.count()
    request.session['feedback_count']=feedback_count
    counsilorss=login_table.objects.filter(type='counsilor')
    counsilor_count=counsilorss.count()
    request.session['counsilor_count'] = counsilor_count
    staff = login_table.objects.filter(type='teacher')
    staff_count = staff.count()
    request.session['staff_count'] = staff_count
    return render(request,'admin/content.html',{
        'feedback':feedback_count,
        'counsilorss':counsilor_count,
        'staff':staff_count
    })
@login_required(login_url='/')
def viewallreport(request):
    ob=report_table.objects.all()
    return render(request, 'admin/view_report.html', {'val': ob})



@login_required(login_url='/')
def viewstudent(request):
    ob=student_table.objects.all()
    return render(request,'admin/view_student.html',{'val':ob})
@login_required(login_url='/')
def unblock_user(request,id):
    obj=login_table.objects.get(id=id)
    obj.type='student'
    obj.save()
    return HttpResponse('''<script>alert("unblock");window.location="/viewstudent"</script>''')
@login_required(login_url='/')
def block_user(request,id):
    obj = login_table.objects.get(id=id)
    obj.type = 'blocked'
    obj.save()
    return HttpResponse('''<script>alert("rejected");window.location="/viewstudent"</script>''')



@login_required(login_url='/')
def viewteacher(request):
    ob=registration_table.objects.all()
    return render(request,'admin/view_teacher.html',{'val':ob})
@login_required(login_url='/')
def viewteachersearch(request):
    type=request.POST['type']
    if type == 'teacher':
     ob=teacher_table.objects.all()
    else:
        ob = registration_table.objects.all()
    return render(request,'admin/view_teacher.html',{'val':ob,"type":type})
@login_required(login_url='/')
def block_teacher(request,id):
    obj = login_table.objects.get(id=id)
    obj.type = 'blocked'
    obj.save()
    return HttpResponse('''<script>alert("rejected");window.location="/viewteacher"</script>''')
@login_required(login_url='/')
def unblock_teacher(request,id):
    obj=login_table.objects.get(id=id)
    obj.type='teacher'
    obj.save()
    return HttpResponse('''<script>alert("unblock");window.location="/viewteacher"</script>''')



@login_required(login_url='/')
def adminviewacounsilors(request):
    ob=counsilor_table.objects.all()
    return render(request,'admin/view_counsilor.html',{'val':ob})
@login_required(login_url='/')
def addacounsilor(request):
    return render(request,'admin/add_counsilor.html')
@login_required(login_url='/')
def addcounsilor_post(request):
   obb=login_table()
   obb.username=request.POST['textfield7']
   obb.password=request.POST['textfield8']
   obb.type='counsilor'
   obb.save()

   ob=counsilor_table()
   ob.name=request.POST['textfield']
   ob.place=request.POST['textfield2']
   ob.phone=request.POST['textfield5']
   ob.email=request.POST['textfield6']
   ob.qualification=request.POST['textfield4']
   ob.LOGIN = obb
   ob.save()
   return HttpResponse(
       '''<script>alert('add counsilor');window.location='adminviewacounsilors'</script>''')
@login_required(login_url='/')
def unblock_counsilor(request,id):
    obj=login_table.objects.get(id=id)
    obj.type='counsilor'
    obj.save()
    return HttpResponse('''<script>alert("unblock");window.location="/adminviewacounsilors"</script>''')
@login_required(login_url='/')
def block_counsilor(request,id):
    obj = login_table.objects.get(id=id)
    obj.type = 'blocked'
    obj.save()
    return HttpResponse('''<script>alert("rejected");window.location="/adminviewacounsilors"</script>''')


@login_required(login_url='/')
def unblock_ac(request,id):
    obj=login_table.objects.get(id=id)
    obj.type='actionboard'
    obj.save()
    return HttpResponse('''<script>alert("unblock");window.location="/viewteacher"</script>''')


@login_required(login_url='/')
def adminviewfeedback(request):
    ob=feedback_table.objects.all()
    return render(request,'admin/view_feedback.html',{'val':ob})







def studetregister(request):
    return render(request,'student/registerindex.html')
def studetregister_post(request):
    print(request.POST)
    name = request.POST['textfield']
    place = request.POST['textfield2']
    phone = request.POST['textfield4']
    email = request.POST['textfield5']
    username = request.POST['textfield6']
    password = request.POST['textfield7']
    cls = request.POST['select2']
    image = request.FILES['file']

    fs = FileSystemStorage()
    fsave = fs.save(image.name, image)


    log_details = login_table()
    log_details.username = username
    log_details.password = password
    log_details.type = 'student'
    log_details.save()

    reg_details = student_table()
    reg_details.LOGIN = log_details
    reg_details.name = name
    reg_details.place = place
    reg_details.phone = phone
    reg_details.email = email
    reg_details.image = fsave
    reg_details.standered = cls

    reg_details.save()
    return HttpResponse('''<script>alert('Registration Successfully completed');window.location='/'</script>''')
@login_required(login_url='/')
def studenthome(request):
    return render(request,'student/index.html')
@login_required(login_url='/')
def viewacounsilor(request):
    ob=counsilor_table.objects.all()
    return render(request,'student/view_counsilor.html',{'val':ob})
@login_required(login_url='/')
def sendreport(request,cid):
    request.session['cid']=cid
    return render(request,'student/reportingreport.html')
@login_required(login_url='/')
def sendreport_post(request):
    category=request.POST['select']
    report=request.POST['textfield']

    report_details = report_table()
    report_details.category=category
    report_details.report=report
    report_details.reply='pending'
    report_details.status='pending'
    report_details.date=datetime.datetime.today()
    report_details.STUDENT=student_table.objects.get(LOGIN__id=request.session['lid'])
    report_details.COUNSILOR=counsilor_table.objects.get(id=request.session['cid'])
    report_details.save()
    return HttpResponse('''<script>alert("report added successfully");window.location="/viewacounsilor"</script>''')
@login_required(login_url='/')
def viewreport(request):
    ob=report_table.objects.filter(STUDENT__LOGIN__id=request.session['lid'])
    return render(request, 'student/view_report.html', {'val': ob})
@login_required(login_url='/')
def addfeedback(request):
    return render(request,'student/sendfeedback.html')
@login_required(login_url='/')
def addfeedback_post(request):
    feedback=request.POST['feedback']
    feedbackdetails=feedback_table()
    feedbackdetails.feedback=feedback
    feedbackdetails.date=datetime.datetime.today()
    feedbackdetails.STUDENT=student_table.objects.get(LOGIN__id=request.session['lid'])
    feedbackdetails.save()
    return HttpResponse('''<script> alert ('feedback send successfully'); window.location='/studenthome';</script>''')












def teacherregister(request):
    return render(request,'teaccheroraction/teacherregister.html')
def teacherregister_post(request):
    print(request.POST)
    name = request.POST['textfield']
    place = request.POST['textfield3']
    qualification = request.POST['textfield2']
    phone = request.POST['textfield4']
    email = request.POST['textfield5']
    username = request.POST['textfield6']
    password = request.POST['textfield7']
    idproof = request.FILES['file2']
    image = request.FILES['file']
    standered=request.POST['select2']


    fs = FileSystemStorage()
    fsave = fs.save(image.name, image)
    fsave1 = fs.save(idproof.name, idproof)


    log_details = login_table()
    log_details.username = username
    log_details.password = password
    log_details.type = 'teacher'
    log_details.save()



    reg_details = teacher_table()
    reg_details.LOGIN = log_details
    reg_details.name = name
    reg_details.place = place
    reg_details.qualification=qualification
    reg_details.phone = phone
    reg_details.email = email
    reg_details.image = fsave
    reg_details.idproof = fsave1
    reg_details.standered=standered



    reg_details.save()
    return HttpResponse('''<script>alert('Registration Successfully completed');window.location='/'</script>''')
@login_required(login_url='/')
def teacherhome(request):
    return render(request,'teaccheroraction/techer index.html')
@login_required(login_url='/')
def teacher_view_report(request):
    te=teacher_table.objects.get(LOGIN__id=request.session['lid'])
    repo=report_table.objects.filter((Q(status = 'forwareded to staff')|Q(status="staff verified")|Q(status="staff rejected")),STUDENT__standered=te.standered)
    return render(request,'teaccheroraction/teacher_view_report.html',{'val':repo})
@login_required(login_url='/')
def teacher_accept_counsilorreply(request,id):
    ob=report_table.objects.get(id=id)
    ob.status='staff verified'
    ob.save()
    return HttpResponse('''<script>alert('verify');window.location='/teacher_view_report'</script>''')
@login_required(login_url='/')
def teacher_reject_counsilorreply(request,id):
    ob=report_table.objects.get(id=id)
    ob.status='staff rejected'
    ob.reply='staff rejected'
    ob.save()
    return HttpResponse('''<script>alert('verify');windows.location='/teacher_view_report'</script>''')










@login_required(login_url='/')
def counsilorhome(request):
    return render(request,'counsilor/index.html')
@login_required(login_url='/')
def counsilorviewreport(request):
    ob = report_table.objects.filter(COUNSILOR__LOGIN__id=request.session['lid'])
    return render(request, 'counsilor/view_report.html', {'val': ob})
@login_required(login_url='/')
def sendreportreply(request,rid):
    request.session['rid']=rid
    return render(request,'counsilor/sendreportreply.html')
@login_required(login_url='/')
def sendreportreply_post(request):
    status = request.POST['status']
    ob = report_table.objects.get(id=request.session['rid'])
    ob.reply = status
    ob.status = 'forwareded to staff'
    ob.save()
    return HttpResponse('''<script>alert("adding");window.location='/counsilorviewreport'</script>''')
@login_required(login_url='/')
def forward_to_actionboard(request, rid):
    ob = report_table.objects.get(id=rid)
    ob.status = 'forwareded to actionboard'
    ob.save()
    return HttpResponse('''<script>alert("Report forwarded"); window.location='/counsilorviewreport';</script>''')

# def action_board_view_report(request):
#     repo=report_table.objects.filter(status='forwarded')
#     return render(request,'teaccheroraction/view_report.html',{'val':repo})
@login_required(login_url='/')
def chooseactionboard(request,id):
    request.session['reid']=id
    ob=registration_table.objects.filter(LOGIN__type="actionboard")
    return render(request,'counsilor/choose_actionbord.html',{'val':ob})
@login_required(login_url='/')
def assignactionboard_post(request):
    name = request.POST['select']
    ob=report_table.objects.get(id=request.session['reid'])
    ob.REGISTER=registration_table.objects.get(id=name)
    ob.status="forwareded to actionboard"
    ob.save()
    return HttpResponse('''<script>alert('choose');window.location='/counsilorviewreport'</script>''')














def actionboardregister(request):
    return render(request,'teaccheroraction/register_register.html')
def actionboardregister_post(request):
    print(request.POST)
    name = request.POST['textfield']
    place = request.POST['textfield3']
    qualification = request.POST['textfield2']
    phone = request.POST['textfield4']
    email = request.POST['textfield5']
    username = request.POST['textfield6']
    password = request.POST['textfield7']
    idproof = request.FILES['file2']
    image = request.FILES['file']


    fs = FileSystemStorage()
    fsave = fs.save(image.name, image)
    fsave1 = fs.save(idproof.name, idproof)


    log_data = login_table()
    log_data.username = username
    log_data.password = password
    log_data.type = 'actionboard'
    log_data.save()

    reg_details = registration_table()
    reg_details.LOGIN = log_data
    reg_details.name = name
    reg_details.place = place
    reg_details.qualification=qualification
    reg_details.phone = phone
    reg_details.email = email
    reg_details.image = fsave
    reg_details.idproof = fsave1



    reg_details.save()
    return HttpResponse('''<script>alert('Registration Successfully completed');window.location='/'</script>''')

@login_required(login_url='/')
def actionboard(request):
    return render(request,'teaccheroraction/action index.html')
@login_required(login_url='/')
def action_board_view_report(request):
    repo=report_table.objects.filter(REGISTER__LOGIN__id=request.session['lid'])
    return render(request,'teaccheroraction/view_report.html',{'val':repo})
@login_required(login_url='/')
def action_board_sendreportreply(request,rid):
    request.session['rid']=rid
    return render(request,'teaccheroraction/sendreportreply.html')
@login_required(login_url='/')
def action_board_sendreportreply_post(request):
    status = request.POST['status']
    ob = report_table.objects.get(id=request.session['rid'])
    ob.reply = status
    ob.status = "forwareded to staff"
    ob.save()
    return HttpResponse('''<script>alert("adding"); window.location='/action_board_view_report';</script>''')































