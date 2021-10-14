require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '買取新規登録' do
    context '新規登録できる場合' do
      it '必要な情報が存在すれば登録できる' do
        expect(@purchase).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'buy_item_nameが空では登録できない' do
        @purchase.buy_item_name = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "品物名を入力してください"
      end
      it 'item_priceが空では登録できない' do
        @purchase.buy_item_price = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "金額を入力してください"
      end
      it 'item_detailが空では登録できない' do
        @purchase.buy_item_detail = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "品物詳細を入力してください"
      end
      it 'customerが紐づいていないと登録できない' do
        @purchase.customer = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "Customerを入力してください"
      end
      it 'item_priceが全角数字では登録できない' do
        @purchase.buy_item_price = '３００００'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "金額は数値で入力してください"
      end
      it 'item_priceが半角数字以外では登録できない' do
        @purchase.buy_item_price = '３万'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "金額は数値で入力してください"
      end
      it 'item_priceが0では登録できない' do
        @purchase.buy_item_price = 0
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include "金額は0以外の値にしてください"
      end
    end
  end
end
