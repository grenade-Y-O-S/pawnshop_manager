require 'rails_helper'

RSpec.describe Pawn, type: :model do
  before do
    @pawn = FactoryBot.build(:pawn)
  end

  describe '質新規登録' do
    context '新規登録できる場合' do
      it '必要な情報が存在すれば登録できる' do
        expect(@pawn).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'item_nameが空では登録できない' do
        @pawn.item_name = ''
        @pawn.valid?
        expect(@pawn.errors.full_messages).to include "品物名を入力してください"
      end
      it 'item_priceが空では登録できない' do
        @pawn.item_price = ''
        @pawn.valid?
        expect(@pawn.errors.full_messages).to include "金額を入力してください"
      end
      it 'item_detailが空では登録できない' do
        @pawn.item_detail = ''
        @pawn.valid?
        expect(@pawn.errors.full_messages).to include "品物詳細を入力してください"
      end
      it 'customerが紐づいていないと登録できない' do
        @pawn.customer = nil
        @pawn.valid?
        expect(@pawn.errors.full_messages).to include "Customerを入力してください"
      end
      it 'item_priceが全角数字では登録できない' do
        @pawn.item_price = '３００００'
        @pawn.valid?
        expect(@pawn.errors.full_messages).to include "金額は数値で入力してください"
      end
      it 'item_priceが半角数字以外では登録できない' do
        @pawn.item_price = '３万'
        @pawn.valid?
        expect(@pawn.errors.full_messages).to include "金額は数値で入力してください"
      end
      it 'item_priceが0では登録できない' do
        @pawn.item_price = 0
        @pawn.valid?
        expect(@pawn.errors.full_messages).to include "金額は0以外の値にしてください"
      end
    end
  end
end