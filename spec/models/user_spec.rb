require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "f_nameが空では登録できない" do
      @user.f_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("F name can't be blank", "F name is invalid")
    end
    it "f_nameが全角でないと登録できない" do
      @user.f_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("F name is invalid")
    end
    it "l_nameが空では登録できない" do
      @user.l_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("L name can't be blank", "L name is invalid")
    end
    it "l_nameが全角でないと登録できない" do
      @user.l_name = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("L name is invalid")
    end
    it "f_name_kanaが空では登録できない" do
      @user.f_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("F name can't be blank", "F name is invalid")
    end
    it "f_name_kanaが全角カタカナでないと登録できない" do
      @user.f_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("F name kana is invalid")
    end
    it "l_name_kanaが空では登録できない" do
      @user.l_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("L name kana can't be blank", "L name kana is invalid")
    end
    it "l_name_kanaが全角カタカナでないと登録できない" do
      @user.l_name_kana = 'てすと'
      @user.valid?
      expect(@user.errors.full_messages).to include("L name kana is invalid")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailには@が含まれていないと登録できない" do
      @user.email = 'testtest'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "emailがユニークでないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password")
    end
    it "passwordとpassword_confirmationが一致していなければ登録できない" do
      @user.password_confirmation = Faker::Internet.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは半角英数字混合でなければ登録できない" do
      @user.password = "1111111111"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
    end
    it "passwordは6文字以上でなければ登録できない" do
      @user.password = "1a1a1"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "全ての情報を正しく入力すれば新規登録が完了する" do
     expect(@user).to be_valid
    end

  end
end