from django.db import models

# Create your models here.
class log_tb(models.Model):
    name=models.CharField(max_length=255)
    email=models.CharField(max_length=255)
    password=models.CharField(max_length=255)
    hashpass=models.TextField()

class admin_tb(models.Model):
    name=models.CharField(max_length=255)
    email=models.CharField(max_length=255)
    password=models.CharField(max_length=255)

class pro_tb(models.Model):
    name=models.CharField(max_length=255)
    price=models.CharField(max_length=255)
    desc=models.TextField()
    image=models.ImageField(upload_to="product/")
    gender=models.CharField(max_length=255)
    category=models.CharField(max_length=255)
    
    
class cart_tb(models.Model):
    pid=models.ForeignKey(pro_tb, on_delete=models.CASCADE)
    uid=models.ForeignKey(log_tb, on_delete=models.CASCADE)
    totalamount=models.CharField(max_length=255)
    status=models.CharField(max_length=255,default="pending")
    quantity=models.CharField(max_length=255)



class payment_tb(models.Model):
    uid=models.ForeignKey(log_tb, on_delete=models.CASCADE)
    total=models.CharField(max_length=255)
    status=models.CharField(max_length=255)
    # image=models.ImageField(upload_to="product/")
    date=models.DateField()
    time=models.TimeField()

# class order_tb(models.Model):
#     name=models.CharField(max_length=255)
#     offprice=models.CharField(max_length=255)
#     status=models.CharField(max_length=255)
#     totalamount=models.CharField(max_length=255)

        
    



