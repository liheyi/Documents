from flask.ext.wtf import From
from wtforms import StringField,BooleanField
from wtforms.validators import DataRequired

class LoginForm(From):
	openid = StringField('openid', validators=[DataRequired()])
	remember_me = BooleanField('remember_me', default = False)
