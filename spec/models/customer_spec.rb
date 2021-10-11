require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
  end

  describe '客新規登録' do
    context '新規登録できる場合' do
      it '必要な情報が存在すれば登録できる' do
        expect(@customer).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'last_nameが空では登録できない' do
        @customer.last_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "姓(漢字)を入力してください"
      end
      it 'first_nameが空では登録できない' do
        @customer.first_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "名(漢字)を入力してください"
      end
      it 'last_name_kanaが空では登録できない' do
        @customer.last_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "姓(カタカナ)を入力してください"
      end
      it 'first_name_kanaが空では登録できない' do
        @customer.first_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "名(カタカナ)を入力してください"
      end
      it 'addressが空では登録できない' do
        @customer.address = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "住所を入力してください"
      end
      it 'phone_numberが空では登録できない' do
        @customer.phone_number = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "電話番号を入力してください"
      end
      it 'birth_dateが空では登録できない' do
        @customer.birth_date = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "生年月日を入力してください"
      end
      it 'jobが空では登録できない' do
        @customer.job = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include "職業を入力してください"
      end
      it 'last_name_kanaがカタカナ以外では登録できない' do
        @customer.last_name_kana = '山田'
        @customer.valid?
        expect(@customer.errors.full_messages).to include "姓(カタカナ)は不正な値です"
      end
      it 'first_name_kanaがカタカナ以外では登録できない' do
        @customer.first_name_kana = '太郎'
        @customer.valid?
        expect(@customer.errors.full_messages).to include "名(カタカナ)は不正な値です"
      end
    end
  end
end
