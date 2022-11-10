require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context"新規登録できるとき" do
      it "全てそろっていれば登録できる" do
       expect(@user).to be_valid
      end
    end
    context "新規登録できないとき" do
    it "ニックネームが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
      expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end
      it "パスワードが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end
      it "姓が空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "姓を入力してください"
      end
      it "名が空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "名を入力してください"
      end
      it "重複したメールアドレスは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
       expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
       end
      it "メールアドレスに＠を含まない場合は登録できない" do
       @user.email = 'testmail'
       @user.valid?
       expect(@user.errors.full_messages).to include 'Eメールは不正な値です'
      end
     it "パスワードが６文字未満だと登録できない" do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワードは6文字以上で入力してください'
        end
     it "パスワードと確認用のパスワードか不一致だと登録できない" do
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end
     it "パスワードが半角英字のみでは登録できない" do
        @user.password = 'aaaaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include  "パスワードには英字と数字の両方を含めて設定してください"
      end
     it "パスワードが半角数字のみでは登録できない" do
       @user.password = '1111111'
       @user.valid?
        expect(@user.errors.full_messages).to include  "パスワードには英字と数字の両方を含めて設定してください"
     end
      it "パスワードに全角文字を含むと登録できない" do
       @user.password = "ああああああ"
       @user.valid?
       expect(@user.errors.full_messages).to include  "パスワードには英字と数字の両方を含めて設定してください"
     end
     it "姓に半角文字が含まれていると登録できない" do
       @user.first_name = 'abc'
       @user.valid?
        expect(@user.errors.full_messages).to include "姓は全角文字を使用してください"
     end
     it "名に半角文字が含まれていると登録できない" do
        @user.last_name = 'abc'
       @user.valid?
       expect(@user.errors.full_messages).to include "名は全角文字を使用してください"
      end
   end
  end
end
