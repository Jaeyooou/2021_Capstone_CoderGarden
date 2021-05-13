from django.contrib.auth.decorators import login_required
from django.shortcuts import render , redirect
from django.contrib.auth.models import User
from django.contrib import auth
from .models import Member , Sourcecode
from django.http import JsonResponse, HttpResponse, HttpResponseRedirect


# Create your views here.

def signup(request):
    # signup 으로 POST 요청이 왔다면, 새로운 유저를 추가해야함
    if request.method == 'POST':
        # password 와 confirm 입력이 같다면
        if request.POST['password'] == request.POST['confirm']:
            #user Object 만들어서 user 객체에 담기
            # user = User.objects.create_user(username = request.POST['username'],
            #                                 password = request.POST['password'],
            #                                # firstname = request.POST['firstname'],
            #                                # lastname = request.POST['lastname']
            #                                 )
            # member = Member.user_id =
            # auth.login(request , user)
            try:
                Member(
                    user_name= request.POST['username'],
                    user_id= request.POST['userid'],
                    user_password=request.POST['password'],
                ).save()
                print("저장 됨 ")
                return redirect('/')
            except:
                print("저장안됨")

        else:
            print("비밀번호를 다시 확인 해 주세요")
            return redirect('/')
    else:
        return render(request , 'signup.html')

def login(request):
    if request.method == 'POST':
        # 유저 아이디랑 비밀번호 가져오기
        userid = request.POST['userid']
        password = request.POST['password']
        print(userid + password)
        #해당 username 과 password와 일치하는 User 객체 가져온다
        try:
            if Member.objects.filter(user_id = userid).exists():
                user = Member.objects.get(user_id = userid)
                if user.user_password == password:
                    print("login 성공하였습니다")
                    request.session['user'] = user.user_id
                    return redirect('/')
                else:
                    print("비밀번호 불일치")
                    return redirect('/login')
            else:
                print("해당 id 유저 없음")
                redirect('/login')
        except:
            return 0
          #딕셔너리에 에러메시지 전달 , 다시 login.html 로 돌아감
        return render(request , 'login.html' , {'error' : 'username or password is incorrect'})

    return render(request , 'login.html')


def code(request):
    if request.method == 'POST':
        print("post method on!")
    return render(request , 'Code_visual.html')


def mypage(request):
    # 세션 or 토큰 권한 없으면 로그인 페이지로 리다이렉트
    # 세션 or 토큰 유효성 있으면,  model.Member 에서 id 값 같은 애들 불러오기
    # id 값과 일치하는 코드들 보여주기
    user_id = request.session.get('user') # 유저의 아이디
    if user_id: # 세션이 존재한다면
        user_num = Member.objects.get(user_id = user_id).user_number
        print(user_num)
    else: # 존재하지 않는다면!
        return redirect('login')

    codelist = Sourcecode.objects.filter(user_number=user_num)
    #codelist = Sourcecode.objects.all()
    #return render(request , 'mypage.html' , {'postlist':codelist})
    return render(request ,'code_list.html' ,  {'codelist':codelist})

def codeview(request , code_num):
    print(code_num)
    usercode = Sourcecode.objects.get(code_number = code_num)
    print(usercode.user_code)

    return render(request , 'detail.html')

