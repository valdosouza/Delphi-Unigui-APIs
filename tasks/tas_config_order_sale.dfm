inherited TasConfigOrderSale: TTasConfigOrderSale
  ClientWidth = 704
  Caption = 'TasConfigOrderSale'
  ExplicitWidth = 720
  ExplicitHeight = 409
  PixelsPerInch = 96
  TextHeight = 13
  inherited UniPanel1: TUniPanel
    Width = 704
  end
  inherited UniPanel2: TUniPanel
    Width = 704
    object UniCheckBox1: TUniCheckBox
      Left = 3
      Top = 5
      Width = 382
      Height = 17
      Hint = ''
      Caption = 'Controlar o uso das Tabelas de Pre'#231'o em rela'#231#227'o ao e a Vista'
      TabOrder = 1
    end
    object UniCheckBox2: TUniCheckBox
      Left = 3
      Top = 22
      Width = 382
      Height = 17
      Hint = ''
      Caption = 'Controlar a edi'#231#227'o do cliente no pedido de venda'
      TabOrder = 2
    end
    object UniCheckBox3: TUniCheckBox
      Left = 3
      Top = 39
      Width = 382
      Height = 17
      Hint = ''
      Caption = 
        'Controlar a edi'#231#227'o do Vendedor ap'#243's a gera'#231#227'o do N'#250'mero do Pedid' +
        'o'
      TabOrder = 3
    end
    object UniCheckBox4: TUniCheckBox
      Left = 3
      Top = 56
      Width = 382
      Height = 17
      Hint = ''
      Caption = 'Controlar a sequ'#234'ncia do n'#250'mero do pedido de venda '
      TabOrder = 4
    end
    object UniCheckBox5: TUniCheckBox
      Left = 3
      Top = 73
      Width = 382
      Height = 17
      Hint = ''
      Caption = 
        'Liberar o aliquota de comiss'#227'o para digitaliza'#231#227'o na inclus'#227'o do' +
        ' item'
      TabOrder = 5
    end
    object UniCheckBox6: TUniCheckBox
      Left = 3
      Top = 90
      Width = 422
      Height = 17
      Hint = ''
      Caption = 
        'Liberar o campo Valor Unit'#225'rio de Venda mesmo para Usu'#225'rio n'#227'o a' +
        'dministrador'
      TabOrder = 6
    end
    object UniCheckBox7: TUniCheckBox
      Left = 3
      Top = 107
      Width = 422
      Height = 17
      Hint = ''
      Caption = 'Controlar a venda de produtos em promo'#231#227'o pela quantidade'
      TabOrder = 7
    end
    object UniCheckBox8: TUniCheckBox
      Left = 3
      Top = 124
      Width = 422
      Height = 17
      Hint = ''
      Caption = 'Utilizar calculo de metros quadrado '
      TabOrder = 8
    end
    object UniCheckBox9: TUniCheckBox
      Left = 3
      Top = 141
      Width = 422
      Height = 17
      Hint = ''
      Caption = 'Mostrar vendedor no pedido de venda '
      TabOrder = 9
    end
    object UniCheckBox10: TUniCheckBox
      Left = 3
      Top = 158
      Width = 422
      Height = 17
      Hint = ''
      Caption = 'Lan'#231'amento de lote autom'#225'tico conforme vencimento'
      TabOrder = 10
    end
    object UniCheckBox11: TUniCheckBox
      Left = 3
      Top = 175
      Width = 422
      Height = 17
      Hint = ''
      Caption = 'Controlar estoque pelo lan'#231'amento do item na nota fiscal'
      TabOrder = 11
    end
    object UniCheckBox12: TUniCheckBox
      Left = 3
      Top = 192
      Width = 422
      Height = 17
      Hint = ''
      Caption = 'Ativar a op'#231#227'o da c'#243'pia de pedido de venda'
      TabOrder = 12
    end
    object UniCheckBox13: TUniCheckBox
      Left = 3
      Top = 209
      Width = 422
      Height = 17
      Hint = ''
      Caption = 
        'Ativar emiss'#227'o de boleto no faturamento quando for esta a forma ' +
        'de pagamento'
      TabOrder = 13
    end
    object UniCheckBox14: TUniCheckBox
      Left = 3
      Top = 226
      Width = 422
      Height = 17
      Hint = ''
      Caption = 
        'Ativar a baixa de pedidos efetuadas na internet ou dispositivo o' +
        ' Android '
      TabOrder = 14
    end
    object UniCheckBox15: TUniCheckBox
      Left = 3
      Top = 243
      Width = 694
      Height = 17
      Hint = ''
      Caption = 
        'Tornar obrigat'#243'rio o preenchimento da al'#237'quota de comiss'#227'o no pr' +
        'oduto para os casos em que '#233' pago comiss'#227'o por produto ao vended' +
        'or    '
      TabOrder = 15
    end
    object UniRadioGroup1: TUniRadioGroup
      Left = 516
      Top = 3
      Width = 185
      Height = 36
      Hint = ''
      Items.Strings = (
        'Aberto '
        'Controlado')
      Caption = 'Tipo de Parcelamento'
      TabOrder = 16
      Columns = 2
    end
    object UniGroupBox1: TUniGroupBox
      Left = 516
      Top = 40
      Width = 185
      Height = 45
      Hint = ''
      Caption = 'Desconto M'#225'ximo no Pedido'
      TabOrder = 17
      object UniEdit1: TUniEdit
        Left = 6
        Top = 17
        Width = 89
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 101
        Top = 20
        Width = 12
        Height = 16
        Hint = ''
        Caption = '%'
        ParentFont = False
        Font.Height = -13
        TabOrder = 2
      end
    end
    object UniGroupBox2: TUniGroupBox
      Left = 516
      Top = 87
      Width = 185
      Height = 45
      Hint = ''
      Caption = 'Desconto Pagamento '#225' Vista'
      TabOrder = 18
      object UniEdit2: TUniEdit
        Left = 6
        Top = 17
        Width = 89
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 101
        Top = 20
        Width = 12
        Height = 16
        Hint = ''
        Caption = '%'
        ParentFont = False
        Font.Height = -13
        TabOrder = 2
      end
    end
    object UniGroupBox3: TUniGroupBox
      Left = 516
      Top = 132
      Width = 185
      Height = 45
      Hint = ''
      Caption = 'Validar Lucratividade'
      TabOrder = 19
      object UniEdit3: TUniEdit
        Left = 6
        Top = 17
        Width = 89
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object UniLabel3: TUniLabel
        Left = 101
        Top = 20
        Width = 12
        Height = 16
        Hint = ''
        Caption = '%'
        ParentFont = False
        Font.Height = -13
        TabOrder = 2
      end
    end
  end
end
