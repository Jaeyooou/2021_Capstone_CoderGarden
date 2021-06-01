from django.contrib.auth.decorators import login_required
from django.shortcuts import render , redirect
from django.contrib.auth.models import User
from django.contrib import auth
from .models import Member, Sourcecode
from django.contrib import messages
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

            # test = Member.objects.get(user_id = request.POST['userid'])
            # print(test)
            # if Member.objects.get(user_id = request.POST['userid']) != None :
            #     messages.info(request , '아이디가 중복되었습니다')
            #     return render(request , 'mainpage.html')

            # else:
            try:
                Member(
                    user_name= request.POST['username'],
                    user_id= request.POST['userid'],
                    user_password=request.POST['password'],
                ).save()
                print("저장 됨 ")
                messages.info(request, '회원가입이 완료되었습니다')

                return redirect('/')
            except:
                messages.info(request , '저장이 되지 않았습니다 다시 한번 시도해주세요')
                return render(request , 'signup.html')

        else:
            print("비밀번호를 다시 확인 해 주세요")
            messages.info(request , '비밀번호가 다릅니다')
            return render(request , 'signup.html')
    else:
        return render(request , 'signup.html')

def login(request):
    login_check = 0
    err_message = ''

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
                    request.session['user_numb'] = user.user_number
                    return render(request , 'main_test.html')
                else:
                    print("비밀번호 불일치")

                    messages.info(request , '비밀번호가 일치하지 않습니다')
                    return render(request , 'login.html')
            else:
                print("해당 id 유저 없음")
                messages.info(request, '해당 유저 id 없음')
                return render(request, 'login.html')
        except:
            return 0
          #딕셔너리에 에러메시지 전달 , 다시 login.html 로 돌아감
        return render(request , 'login.html')

    return render(request , 'login.html')
def logout(request):# 로그아웃
    if request.session.get('user_numb'):
        del(request.session['user_numb'])
        return redirect('/')
    return redirect('/',{'login_check' : 0})
def code(request):
    if request.method == 'POST':
        print("post method on!")
    return render(request , 'Code_visual.html')



def mypage(request):
    # 세션 or 토큰 권한 없으면 로그인 페이지로 리다이렉트
    # 세션 or 토큰 유효성 있으면,  model.Member 에서 id 값 같은 애들 불러오기
    # id 값과 일치하는 코드들 보여주기
    user_session_numb = request.session.get('user_numb') # 유저의 아이디
    if user_session_numb: # 세션이 존재한다면
        user_num = Member.objects.get(user_number = user_session_numb)
        print(user_num)
    else: # 존재하지 않는다면!
        return redirect('login')

    codelist = Sourcecode.objects.filter(user_number=user_num)
    #codelist = Sourcecode.objects.all()
    #return render(request , 'mypage.html' , {'postlist':codelist})
    return render(request ,'code_list.html' ,  {'codelist':codelist})

def codeview(request , code_num):
    print(code_num)
    code = Sourcecode.objects.get(code_number = code_num)
    print(code.user_code)
    return render(request , 'MycodeList.html' ,{'code' : code.user_code})
