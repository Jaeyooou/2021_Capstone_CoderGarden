from django.shortcuts import render , redirect
from django.contrib.auth.models import User
from django.contrib import auth

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
            print(request.POST['username'])
            print(request.POST['password'])
            user = User;
            user.username = request.POST['username']
            user.password = request.POST['password']
            user.save(self = )
            return redirect('/')
    else:
        return render(request , 'signup.html')

def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        #해당 username 과 password와 일치하는 User 객체 가져온다
        user = auth.authenticate(request , username = username,
                                 password = password)

        # 해당 user 객체 존재한다면 login
        if user is not None:
            auth.login(request , user)
            #메인 페이지로 돌아가기
            return redirect('/')
        else:
            #딕셔너리에 에러메시지 전달 , 다시 login.html 로 돌아감
            return render(request , 'login.html' , {'error' : 'username or password is incorrect'})



    return render(request , 'login.html')

