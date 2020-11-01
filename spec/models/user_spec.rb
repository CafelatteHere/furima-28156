require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @user2 = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "必須項目を全て入力し、ユーザー登録ができる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "12345y"
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
     end
      it "surname, nameが漢字であれば登録できる" do
        @user.surname = "漢字"
        @user.name = "漢字"
        expect(@user).to be_valid
      end
      it "surname, nameがひらがなであれば登録できる" do
        @user.surname = "ひらがな字"
        @user.name = "ひらがな字"
        expect(@user).to be_valid
      end
      it "surname, nameがカタカナであれば登録できる" do
        @user.surname = "カタカナ"
        @user.name = "カタカナ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        @user2.email = @user.email
        @user2.valid?
        expect(@user2.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに@がないと登録できない" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email は@を含む必要がある")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "aaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordは半角英数字混合でないと登録できない" do

      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "surnameが空だと登録できない" do
        @user.surname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "surname, nameは、全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.surname = "tanaka"
        @user.name = "ichiro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname 全角文字を使用してください", "Name 全角文字を使用してください")
      end
      it "surname_furiganaが空だと登録できない" do
        @user.surname_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname furigana can't be blank")
      end
      it "name_furiganaが空だと登録できない" do
        @user.name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name furigana can't be blank")
      end
      it "surname_furigana, name_furiganaは半角だと登録できない" do
        @user.surname_furigana = "ﾔﾏﾀﾞ"
        @user.name_furigana = "ﾊﾅｺ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname furigana 全角カタカナを使用してください", "Name furigana 全角カタカナを使用してください")
      end
      it "surname_furigana, name_furiganaはラテン文字だと登録できない" do
        @user.surname_furigana = "yamadaﾞ"
        @user.name_furigana = "hanako"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname furigana 全角カタカナを使用してください", "Name furigana 全角カタカナを使用してください")
      end
      it "surname_furigana, name_furiganaは漢字だと登録できない" do
        @user.surname_furigana = "山田ﾞ"
        @user.name_furigana = "花子"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname furigana 全角カタカナを使用してください", "Name furigana 全角カタカナを使用してください")
      end
      it "surname_furigana, name_furiganaはひらがなだと登録できない" do
        @user.surname_furigana = "みけﾞ"
        @user.name_furigana = "ねこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname furigana 全角カタカナを使用してください", "Name furigana 全角カタカナを使用してください")
      end
      it "birthdayが空だと登録できな" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end

  end
end
