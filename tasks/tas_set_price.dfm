inherited TasSetPrice: TTasSetPrice
  ClientHeight = 384
  ClientWidth = 460
  Caption = 'TasSetPrice'
  ExplicitWidth = 476
  ExplicitHeight = 443
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel [0]
    Left = 0
    Top = 0
    Width = 460
    Height = 384
    Hint = ''
    Align = alClient
    TabOrder = 0
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniPageControl1: TUniPageControl
      Left = 2
      Top = 2
      Width = 456
      Height = 317
      Hint = ''
      ActivePage = UniTabSheet2
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'M'#250'ltiplos'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 448
          Height = 289
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object Ctn_Category: TUniContainerPanel
            Left = 3
            Top = 3
            Width = 439
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 1
          end
          object Ctn_Brand: TUniContainerPanel
            Left = 3
            Top = 43
            Width = 439
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 2
          end
          object Ctn_Price_List: TUniContainerPanel
            Left = 3
            Top = 83
            Width = 439
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 3
          end
          object UniRadioGroup1: TUniRadioGroup
            Left = 3
            Top = 122
            Width = 162
            Height = 40
            Hint = ''
            Items.Strings = (
              'Acrescimo'
              'Desconto')
            Caption = 'Tipo de Opera'#231#227'o'
            TabOrder = 4
            Columns = 2
          end
          object UniRadioGroup2: TUniRadioGroup
            Left = 167
            Top = 122
            Width = 187
            Height = 40
            Hint = ''
            Items.Strings = (
              '2'
              '3'
              '4'
              '5'
              '6')
            Caption = 'Casas Decimais'
            TabOrder = 5
            Columns = 5
          end
          object UniLabel1: TUniLabel
            Left = 356
            Top = 125
            Width = 52
            Height = 13
            Hint = ''
            Caption = 'Margem %'
            TabOrder = 6
          end
          object UniEdit1: TUniEdit
            Left = 356
            Top = 140
            Width = 86
            Hint = ''
            Text = ''
            TabOrder = 7
          end
          object UniGroupBox1: TUniGroupBox
            Left = 3
            Top = 163
            Width = 439
            Height = 102
            Hint = ''
            Caption = 'Atualizar pre'#231'os de uma nota de compra espec'#237'fica'
            TabOrder = 8
            object UniLabel2: TUniLabel
              Left = 4
              Top = 15
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'C'#243'digo'
              TabOrder = 1
            end
            object UniEdit2: TUniEdit
              Left = 4
              Top = 29
              Width = 53
              Hint = ''
              Text = ''
              TabOrder = 2
            end
            object Ctn_Provider: TUniContainerPanel
              Left = 60
              Top = 16
              Width = 374
              Height = 38
              Hint = ''
              ParentColor = False
              TabOrder = 3
            end
            object UniLabel3: TUniLabel
              Left = 4
              Top = 57
              Width = 107
              Height = 13
              Hint = ''
              Caption = 'N'#250'mero da Nota Fiscal'
              TabOrder = 4
            end
            object UniEdit3: TUniEdit
              Left = 4
              Top = 71
              Width = 133
              Hint = ''
              Text = ''
              TabOrder = 5
            end
          end
          object UniCheckBox1: TUniCheckBox
            Left = 3
            Top = 267
            Width = 278
            Height = 17
            Hint = ''
            Caption = 'Retirar obrigatoriedade da Categoria e Marca'
            TabOrder = 9
          end
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Individual'
        object UniPanel3: TUniPanel
          Left = 0
          Top = 0
          Width = 448
          Height = 289
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object UniLabel4: TUniLabel
            Left = 3
            Top = 3
            Width = 74
            Height = 13
            Hint = ''
            Caption = 'C'#243'digo Produto'
            TabOrder = 1
          end
          object UniEdit4: TUniEdit
            Left = 3
            Top = 18
            Width = 86
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object UniEdit5: TUniEdit
            Left = 91
            Top = 18
            Width = 351
            Hint = ''
            Text = ''
            TabOrder = 3
          end
          object UniLabel5: TUniLabel
            Left = 91
            Top = 3
            Width = 82
            Height = 13
            Hint = ''
            Caption = 'C'#243'digo de Barras'
            TabOrder = 4
          end
          object UniLabel7: TUniLabel
            Left = 3
            Top = 82
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'Valor Normal'
            TabOrder = 5
          end
          object UniEdit7: TUniEdit
            Left = 3
            Top = 96
            Width = 121
            Hint = ''
            Text = ''
            TabOrder = 6
          end
          object UniLabel8: TUniLabel
            Left = 126
            Top = 82
            Width = 74
            Height = 13
            Hint = ''
            Caption = 'Valor Promo'#231#227'o'
            TabOrder = 7
          end
          object UniEdit8: TUniEdit
            Left = 126
            Top = 96
            Width = 121
            Hint = ''
            Text = ''
            TabOrder = 8
          end
          object UniCheckBox2: TUniCheckBox
            Left = 3
            Top = 122
            Width = 150
            Height = 17
            Hint = ''
            Caption = 'Produto em promo'#231#227'o'
            TabOrder = 9
          end
          object Ctn_Product: TUniContainerPanel
            Left = 3
            Top = 43
            Width = 439
            Height = 38
            Hint = ''
            ParentColor = False
            TabOrder = 10
          end
        end
      end
    end
    object UniPanel4: TUniPanel
      Left = 2
      Top = 321
      Width = 456
      Height = 61
      Hint = ''
      Align = alBottom
      TabOrder = 2
      BorderStyle = ubsFrameLowered
      Caption = ''
      object UniButton2: TUniButton
        Left = 3
        Top = 3
        Width = 90
        Height = 54
        Hint = ''
        Caption = 'Confirmar'
        TabOrder = 1
      end
      object UniButton3: TUniButton
        Left = 94
        Top = 3
        Width = 90
        Height = 54
        Hint = ''
        Caption = 'Fechar'
        TabOrder = 2
      end
    end
  end
end
