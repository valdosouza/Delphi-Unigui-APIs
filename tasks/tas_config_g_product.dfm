inherited TasConfigGProduct: TTasConfigGProduct
  ClientHeight = 563
  ClientWidth = 587
  Caption = 'Configura'#231#245'es para '
  ExplicitWidth = 603
  ExplicitHeight = 622
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botton: TUniPanel
    Top = 499
    Width = 587
    ExplicitTop = 499
    ExplicitWidth = 587
    inherited SB_Ok: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Cancel: TUniSpeedButton
      ExplicitLeft = 100
    end
  end
  inherited pnl_body: TUniPanel
    Width = 587
    Height = 499
    ExplicitWidth = 587
    ExplicitHeight = 499
    object UniPageControl1: TUniPageControl
      Left = 2
      Top = 2
      Width = 583
      Height = 495
      Hint = ''
      ActivePage = tbs_calc
      Align = alClient
      TabOrder = 1
      object tbs_general: TUniTabSheet
        Hint = ''
        Caption = 'Geral'
        object UniCheckBox1: TUniCheckBox
          Left = 0
          Top = 0
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Ativar busca por c'#243'digo exato'
          Align = alTop
          TabOrder = 0
        end
        object UniCheckBox10: TUniCheckBox
          Left = 0
          Top = 152
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Detalhar os dados da Substitui'#231#227'o Tribut'#225'ria nos itens da NF-e'
          Align = alTop
          TabOrder = 1
        end
        object UniCheckBox11: TUniCheckBox
          Left = 0
          Top = 169
          Width = 575
          Height = 17
          Hint = ''
          Caption = 
            'Utilizar Calculo de M'#178' para informar quantidade de itens nos ped' +
            'idos'
          Align = alTop
          TabOrder = 2
        end
        object UniCheckBox12: TUniCheckBox
          Left = 0
          Top = 186
          Width = 575
          Height = 17
          Hint = ''
          Caption = 
            'Efetuar arredondamento mod(50) Ex (Entre 12,01 e 12,49 = 12,50 (' +
            'Entre 12,51 e 12,99 = 13,00)'
          Align = alTop
          TabOrder = 3
        end
        object UniCheckBox2: TUniCheckBox
          Left = 0
          Top = 135
          Width = 575
          Height = 17
          Hint = ''
          Caption = 
            'Fazer distin'#231#227'o de Produtos entre Acabado e Mat'#233'ria-Prima nas op' +
            'era'#231#245'es de Venda'
          Align = alTop
          TabOrder = 4
        end
        object UniCheckBox3: TUniCheckBox
          Left = 0
          Top = 118
          Width = 575
          Height = 17
          Hint = ''
          Caption = 
            'Agregar (observa'#231#227'o da descri'#231#227'o do produto) na observa'#231#227'o da NF' +
            'e'
          Align = alTop
          TabOrder = 5
        end
        object UniCheckBox4: TUniCheckBox
          Left = 0
          Top = 101
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Compartilhar Produto(s) Multi Empresa'
          Align = alTop
          TabOrder = 6
        end
        object UniCheckBox5: TUniCheckBox
          Left = 0
          Top = 84
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Controlar Duplica'#231#227'o de C'#243'digo de F'#225'brica'
          Align = alTop
          TabOrder = 7
        end
        object UniCheckBox6: TUniCheckBox
          Left = 0
          Top = 67
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Produtos do Tipo de Revenda de Ve'#237'culos'
          Align = alTop
          TabOrder = 8
        end
        object UniCheckBox7: TUniCheckBox
          Left = 0
          Top = 51
          Width = 575
          Height = 16
          Hint = ''
          Caption = 'Validar Al'#237'quota de Comiss'#227'o'
          Align = alTop
          TabOrder = 9
        end
        object UniCheckBox8: TUniCheckBox
          Left = 0
          Top = 34
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Validar Data de Vencimento do Cadastro do Lote'
          Align = alTop
          TabOrder = 10
        end
        object UniCheckBox9: TUniCheckBox
          Left = 0
          Top = 17
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Registrar as altera'#231#245'es de pre'#231'o de Venda'
          Align = alTop
          TabOrder = 11
        end
      end
      object tbs_calc: TUniTabSheet
        AlignWithMargins = True
        Hint = ''
        Caption = 'C'#225'lculos'
        object UniGroupBox2: TUniGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 569
          Height = 50
          Hint = ''
          Caption = 'C'#225'lculo De Margem de Lucro'
          Align = alTop
          TabOrder = 0
          object Rb_Kind_Formule_1: TUniRadioButton
            Left = 2
            Top = 15
            Width = 110
            Height = 33
            Hint = ''
            Align = alLeft
            Caption = 'C'#225'lculo Tipo 1'
            TabOrder = 1
            ExplicitLeft = -4
            ExplicitTop = 14
          end
          object Rb_Kind_Formule_2: TUniRadioButton
            Left = 112
            Top = 15
            Width = 113
            Height = 33
            Hint = ''
            Align = alLeft
            Caption = 'C'#225'lculo Tipo 2'
            TabOrder = 2
            ExplicitLeft = 108
            ExplicitTop = 14
          end
          object UniLabel1: TUniLabel
            Left = 227
            Top = 15
            Width = 134
            Height = 13
            Hint = ''
            Caption = 'F'#243'rmula : Pre'#231'o de Venda ='
            TabOrder = 3
          end
          object UniLabel2: TUniLabel
            Left = 276
            Top = 32
            Width = 248
            Height = 13
            Hint = ''
            Caption = 'Pre'#231'o de Custo + (Pre'#231'o de Custo * Taxa de Lucro)'
            TabOrder = 4
          end
        end
        object UniGroupBox3: TUniGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 244
          Width = 569
          Height = 50
          Hint = ''
          Caption = 'Movimenta'#231#227'o de Produtos'
          Align = alTop
          TabOrder = 1
          object UniLabel3: TUniLabel
            Left = 6
            Top = 20
            Width = 184
            Height = 13
            Hint = ''
            Caption = 'Verificar se h'#225' inatividade por mais de '
            TabOrder = 1
          end
          object UniEdit1: TUniEdit
            Left = 196
            Top = 14
            Width = 69
            Hint = ''
            Text = 'UniEdit1'
            TabOrder = 2
          end
          object UniLabel4: TUniLabel
            Left = 270
            Top = 20
            Width = 18
            Height = 13
            Hint = ''
            Caption = 'dia.'
            TabOrder = 3
          end
          object UniCheckBox24: TUniCheckBox
            Left = 294
            Top = 15
            Width = 291
            Height = 17
            Hint = ''
            Caption = 'Desativar produto com saldo zero no cadastro'
            TabOrder = 4
          end
        end
        object UniGroupBox4: TUniGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 300
          Width = 569
          Height = 67
          Hint = ''
          Caption = 'Defini'#231#227'o de Margem Decimais'
          Align = alTop
          TabOrder = 2
          object UniRadioGroup4: TUniRadioGroup
            Left = 2
            Top = 15
            Width = 231
            Height = 50
            Hint = ''
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5')
            Align = alLeft
            Caption = '[Vendas]'
            TabOrder = 1
            Columns = 5
          end
          object UniRadioGroup5: TUniRadioGroup
            Left = 233
            Top = 15
            Width = 231
            Height = 50
            Hint = ''
            Items.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5')
            Align = alLeft
            Caption = '[Compras]'
            TabOrder = 2
            Columns = 5
          end
        end
        object UniRadioGroup1: TUniRadioGroup
          AlignWithMargins = True
          Left = 3
          Top = 76
          Width = 569
          Height = 50
          Hint = ''
          Items.Strings = (
            'Autom'#225'tico'
            'Manual'
            'N'#227'o Atualizar')
          Align = alTop
          Caption = 'Atualiza'#231#227'o de Pre'#231'o de Venda na Compra'
          TabOrder = 3
          Columns = 3
        end
        object UniRadioGroup2: TUniRadioGroup
          AlignWithMargins = True
          Left = 3
          Top = 132
          Width = 569
          Height = 50
          Hint = ''
          Items.Strings = (
            'Pre'#231'o de Custo'
            'Custo Real')
          Align = alTop
          Caption = 'Relat'#243'rio Invent'#225'rio e Saldo Estoque'
          TabOrder = 4
          Columns = 2
        end
        object rdg_from_update_pricetag: TUniRadioGroup
          AlignWithMargins = True
          Left = 3
          Top = 188
          Width = 569
          Height = 50
          Hint = ''
          Items.Strings = (
            'Pre'#231'o de Custo'
            'Custo Real')
          Align = alTop
          Caption = 'Calcular o pre'#231'o de venda a partir do campo '
          TabOrder = 5
          Columns = 2
        end
        object Chbx_AutoCalcPriceTag: TUniCheckBox
          Left = 0
          Top = 56
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Efetuar o c'#225'lculo autom'#225'tico ao editar cadastro '
          Align = alTop
          TabOrder = 6
        end
      end
      object tbs_abas: TUniTabSheet
        Hint = ''
        Caption = 'Controle de Abas'
        object UniCheckBox13: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Fornecedor'
          Align = alTop
          TabOrder = 0
        end
        object UniCheckBox14: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 26
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Impostos'
          Align = alTop
          TabOrder = 1
        end
        object UniCheckBox15: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 49
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Tabela de Pre'#231'o'
          Align = alTop
          TabOrder = 2
        end
        object UniCheckBox16: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 89
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Imagem'
          Align = alTop
          TabOrder = 3
        end
        object UniCheckBox17: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 112
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Instala'#231#227'o'
          Align = alTop
          TabOrder = 4
        end
        object UniCheckBox18: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 135
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Estoque'
          Align = alTop
          TabOrder = 5
        end
        object UniCheckBox19: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 158
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Composi'#231#227'o'
          Align = alTop
          TabOrder = 6
        end
        object UniCheckBox20: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 181
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Insumo de Produ'#231#227'o'
          Align = alTop
          TabOrder = 7
        end
        object UniCheckBox21: TUniCheckBox
          AlignWithMargins = True
          Left = 3
          Top = 204
          Width = 569
          Height = 17
          Hint = ''
          Caption = 'Aplica'#231#227'o'
          Align = alTop
          TabOrder = 8
        end
        object UniCheckBox22: TUniCheckBox
          Left = 0
          Top = 69
          Width = 575
          Height = 17
          Hint = ''
          Caption = 'Bot'#245'es'
          Align = alTop
          TabOrder = 9
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 400
    Top = 456
  end
  inherited ds_msg: TDataSource
    Left = 400
    Top = 512
  end
  inherited MenuTask: TUniMainMenu
    Left = 296
    Top = 504
  end
end
