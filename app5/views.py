from django.shortcuts import render
from django.http import HttpResponseRedirect,JsonResponse,HttpResponse
from app5.models import *
import os
import random
import string
from django.conf import settings
from django.core.mail import send_mail
import datetime
import hashlib



# Create your views here.
def index(request):
	data=pro_tb.objects.all()
	category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
	return render(request,'index.html',{"data":data,"cat":category})

def checkout(request):
	uid=request.session["myid"]
	uidd=log_tb.objects.get(id=uid)
	data=pro_tb.objects.all()
	category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
	cart=cart_tb.objects.filter(uid=uidd,status="pending")
	total=0
	for x in cart:
		price=x.totalamount
		total=float(price)+total
	return render(request,'checkout.html',{"data":data,"total":total,"cart":cart,"cat":category})

def codes(request):
	data=pro_tb.objects.all()
	category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
	return render(request,'codes.html',{"data":data,"cat":category})
	
def contact(request):
	data=pro_tb.objects.all()
	category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
	return render(request,'contact.html',{"data":data,"cat":category})
def electronics(request):
	data=pro_tb.objects.all()
	category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
	return render(request,'electronics.html',{"data":data,"cat":category})
def products(request):
	gd=request.GET["gd"]
	ct=request.GET["ct"]
	data=pro_tb.objects.all()
	category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
	data1=pro_tb.objects.filter(gender=gd,category=ct)
	content={"datakey":data1,"data":data,"category":ct,"cat":category,"gender":gd}
	
	return render(request,'products.html',content)
def single(request):
	if request.session.has_key("myid"):
		prdid=request.GET['pid']
		data=pro_tb.objects.filter(id=prdid)
		category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
		return render(request,'single.html',{"data":data,"cat":category})
	else:
		return HttpResponseRedirect('/login/')
def womens(request):
	data=pro_tb.objects.all()
	category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
	return render(request,'womens.html',{"data":data,"cat":category})
def register(request):
	if request.method == "POST":
		cname=request.POST['name']
		cemail=request.POST['email']
		cpassword=request.POST['password']
		hashpass=hashlib.md5(cpassword.encode('utf8')).hexdigest()
	
		check=log_tb.objects.filter(email=cemail)
		if check:
			return render(request,'register.html',{'error':'already registered'})
		else:
			add=log_tb(name=cname,email=cemail,password=cpassword,hashpass=hashpass)
			add.save()

			x = ''.join(random.choices(cname + string.digits, k=8))
			y = ''.join(random.choices(string.ascii_letters + string.digits, k=7))
			subject = 'welcome to project 5'
			message = f'Hi {cname}, thank you for registering in project 5 . your user username: {cname} and  password: {cpassword}. Follow https://Wa.me/+18478527243 or https://www.tinder.com'
			email_from = settings.EMAIL_HOST_USER 
			recipient_list = [cemail, ] 
			send_mail( subject, message, email_from, recipient_list ) 
		return render(request,'index.html',{'success':"data saved"})
	else:
	
	    return render(request,'register.html')
def login(request):
	if request.method == "POST":
		cemail=request.POST['email']
		cpassword=request.POST['password']
		hashpass=hashlib.md5(cpassword.encode('utf8')).hexdigest()
		check=log_tb.objects.filter(email=cemail,password=cpassword,hashpass=hashpass)
		if check:
			for x in check:
				request.session['myid']=x.id
				request.session['myname']=x.name
				data=pro_tb.objects.all()
			return render(request,'index.html',{'success':'successfully logined'})
		else:
			return render(request,'index.html',{'error':' invalid details'})
	else:
		return render(request,'index.html')
def logout(request):
	if request.session.has_key("myid"):
	    del request.session['myid']
	    del request.session['myname']
	return HttpResponseRedirect ('/')

def addcart(request):
	if request.method == "POST":
		pid=request.GET['pid']
		prdid=pro_tb.objects.get(id=pid)
		uid=request.session['myid']
		uidd=log_tb.objects.get(id=uid)
		product=pro_tb.objects.filter(id=pid)
		qty=request.POST['qty']

		check=cart_tb.objects.filter(pid=prdid,uid=uidd,status="pending")
		total=0
		for x in product:
			price=x.price
		delv=(float(price)*10)/100
		total=delv+(float(price)*int(qty))
		if check:
			cart=cart_tb.objects.filter(uid=uidd,status="pending")
			total=0
			for x in cart:
				price=x.totalamount
				total=float(price)+total
			return render(request,'checkout.html',{"cart":cart,'error':'already saved',"total":total})
		else:
			add=cart_tb(pid=prdid,uid=uidd,totalamount=total,quantity=qty)
			add.save()
			cart=cart_tb.objects.filter(uid=uidd,status="pending")
			total=0
			for x in cart:
				price=x.totalamount
				total=float(price)+total
			return render(request,"checkout.html",{"cart":cart,"total":total})
	else:
		prdid=request.GET['pid']
		data=pro_tb.objects.filter(id=prdid)
		category=pro_tb.objects.raw('SELECT * FROM app5_pro_tb GROUP BY gender,category')
		return render(request,'single.html',{"data":data,"cat":category})
def updatecart(request):
	cid=request.GET['cid']
	qty=request.POST['qty']
	data=cart_tb.objects.filter(id=cid)
	for x in data:
		price=x.pid.price
	delv=(float(price)*10)/100
	newprice=(float(qty)*float(price)+float(delv))
	cart_tb.objects.filter(id=cid).update(totalamount=newprice,quantity=qty)
	return HttpResponseRedirect("/checkout/")

def removecart(request):
	cid=request.GET['cid']
	cart_tb.objects.filter(id=cid).delete()
	return HttpResponseRedirect("/checkout/")



	####################################################################################################################################
	###############################################Admin################################################################################

def admin_index(request):
	if request.session.has_key("my_id"):
		return render(request,'admin/index.html')
	else:
		return HttpResponseRedirect('/admin_login')
def admin_shoes(request):
	return render(request,'admin/shoes.html')
def admin_bags(request):
	return render(request,'admin/bags.html')
def admin_sweater(request):
	return render(request,'admin/sweater.html')
def admin_sunglasses(request):
	return render(request,'admin/sunglasses.html')
def admin_register(request):
	if request.method == "POST":
		cname=request.POST['name']
		cemail=request.POST['email']
		cpassword=request.POST['password']
		check=admin_tb.objects.filter(email=cemail)
		if check:
			return render(request,'admin/register.html',{'error':'already registered'})
		else:
			add=admin_tb(name=cname,email=cemail,password=cpassword)
			add.save()
		return render(request,'admin/index.html',{'success':"data saved"})
	else:
	    return render(request,'admin/register.html')
def admin_input(request):
	return render(request,'admin/input.html')
def admin_validation(request):
	return render(request,'admin/validation.html')

def admin_login(request):
	if request.method == "POST":
		cemail=request.POST['email']
		cpassword=request.POST['password']
		check=admin_tb.objects.filter(email=cemail,password=cpassword)
		if check:
			for x in check:
				request.session['my_id']=x.id
				request.session['my_name']=x.name
			return render(request,'admin/index.html',{'success':'successfully logined'})
		else:
			return render(request,'admin/index.html',{'error':' invalid details'})
	else:
		return render(request,'admin/index.html')
def admin_logout(request):
	if request.session.has_key("my_id"):
	    del request.session['my_id']
	    del request.session['my_name']
	return HttpResponseRedirect ('/admin_login/')

def admin_input(request):
	if request.method == "POST":
		cname=request.POST['name']
		cprice=request.POST['price']
		cdesc=request.POST['desc']
		cimage=request.FILES['image']
		cgender=request.POST['gender']
		ccategory=request.POST['category']
		check=pro_tb.objects.filter(name=cname)
		if check:
			return render(request,'admin/input.html',{'error':'already registered'})
		else:
			add=pro_tb(name=cname,price=cprice,desc=cdesc,image=cimage,gender=cgender,category=ccategory)
			add.save()
		return render(request,'admin/index.html',{'success':"data saved"})
	else:
		return render(request,'admin/input.html')
    
	
def admin_table(request):
	data=pro_tb.objects.all()
	return render(request,'admin/table.html',{'details':data})
	
def admin_update(request):
	if request.method == "POST":
		cname=request.POST['name']
		cprice=request.POST['price']
		cdesc=request.POST['desc']
		cgender=request.POST['gender']
		ccategory=request.POST['category']
		prdid=request.GET['uid']
		imgval=request.POST['imgup']
		if imgval =="yes":

			cimage=request.FILES['image']
			oldrec=pro_tb.objects.filter(id=prdid)
			updrec=pro_tb.objects.get(id=prdid)
			for x in oldrec:
				imgurl=x.image.url
				pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imgurl
				if os.path.exists(pathtoimage):
					os.remove(pathtoimage)
					print('successfully deleted')
			updrec.image=cimage
			updrec.save()

        
		add=pro_tb.objects.filter(id=prdid).update(name=cname,price=cprice,desc=cdesc,gender=cgender,category=ccategory)
		return HttpResponseRedirect('/admin_table/')
	else:
		prdid=request.GET['uid']
		data=pro_tb.objects.filter(id=prdid)
		return render(request,"admin/update.html",{'details':data})

def admin_delete(request):
	    prdid=request.GET['did']
	    oldrec=pro_tb.objects.filter(id=prdid)
	    for x in oldrec:
	    	imgurl=x.image.url
	    	pathtoimage=os.path.dirname(os.path.dirname(os.path.abspath(__file__)))+imgurl
	    	if os.path.exists(pathtoimage):
	    		os.remove(pathtoimage)
	    data=pro_tb.objects.filter(id=prdid).delete()
	    return HttpResponseRedirect('/admin_table/')

def admin_payment_table(request):
	data=payment_tb.objects.all()
	return render(request,'admin/payment_table.html',{'details':data})


def admin_order_table(request):
	data=cart_tb.objects.all()
	return render(request,'admin/order_table.html',{'details':data})

def admin_formtab(request):
	data=log_tb.objects.all()
	return render(request,'admin/formtab.html',{'details':data})

def ajaxview(request):

	uid=request.GET.get('uid')
	user=log_tb.objects.all().filter(id=uid)
	for x in user:
		name=x.name
		email=x.email
		
	dat={"aa":name,"bb":email}
	print(dat)
	return JsonResponse(dat)	
  
#########################################################################################################

def payment_index(request):
	if request.method == "POST":
		uid=request.session['myid']
		uidd=log_tb.objects.get(id=uid)
		cdate=datetime.datetime.now().date()
		ctime=datetime.datetime.now().time()
		total=request.POST['total']
		add=payment_tb(uid=uidd,status="paid",total=total,date=cdate,time=ctime)
		add.save()
		cart_tb.objects.filter(uid=uidd,status="pending").update(status="paid")
		return HttpResponseRedirect("/")
	else:
		total=request.GET['gt']
		return render(request,'payment/index.html',{"total":total})
	


from reportlab.pdfgen import canvas 
from django.views.generic import View
from project5.utils import render_to_pdf

def downloadpdf(request):
	pid=request.GET['pid']
	data=payment_tb.objects.filter(id=pid)
	pdf=render_to_pdf('pdfdownload.html',{'data':data})
	return HttpResponse(pdf,content_type='application/pdf')
	