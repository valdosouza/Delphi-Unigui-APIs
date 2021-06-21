inherited TasOrderBudgetMedia: TTasOrderBudgetMedia
  ClientHeight = 464
  ClientWidth = 676
  Caption = 'TasOrderBudgetMedia'
  ExplicitTop = -69
  ExplicitWidth = 692
  ExplicitHeight = 523
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 400
    Width = 676
  end
  inherited pnl_fundo: TUniPanel
    Width = 676
    Height = 400
    ExplicitTop = -2
    ExplicitWidth = 676
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 672
      Height = 143
      Hint = ''
      Align = alTop
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Caption = ''
      object UniEdit1: TUniEdit
        Left = 4
        Top = 23
        Width = 91
        Hint = ''
        Text = ''
        TabOrder = 1
      end
      object UniLabel1: TUniLabel
        Left = 192
        Top = 8
        Width = 40
        Height = 13
        Hint = ''
        Caption = 'Validade'
        TabOrder = 2
      end
      object UniLabel2: TUniLabel
        Left = 97
        Top = 8
        Width = 23
        Height = 13
        Hint = ''
        Caption = 'Data'
        TabOrder = 3
      end
      object UniLabel3: TUniLabel
        Left = 4
        Top = 8
        Width = 37
        Height = 13
        Hint = ''
        Caption = 'N'#250'mero'
        TabOrder = 4
      end
      object UniDateTimePicker1: TUniDateTimePicker
        Left = 97
        Top = 23
        Width = 93
        Hint = ''
        DateTime = 42977.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 5
      end
      object UniDateTimePicker2: TUniDateTimePicker
        Left = 192
        Top = 23
        Width = 95
        Hint = ''
        DateTime = 42977.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 6
      end
      object UniRadioGroup1: TUniRadioGroup
        Left = 290
        Top = 8
        Width = 170
        Height = 37
        Hint = ''
        Items.Strings = (
          'Jornal'
          'R'#225'dio')
        Caption = 'Tipo'
        TabOrder = 7
        Columns = 2
      end
      object UniGroupBox1: TUniGroupBox
        Left = 465
        Top = 8
        Width = 202
        Height = 44
        Hint = ''
        Caption = 'Vencimento/Status da Cota'#231#227'o'
        TabOrder = 8
        object UniCheckBox1: TUniCheckBox
          Left = 116
          Top = 20
          Width = 97
          Height = 17
          Hint = ''
          Checked = True
          Caption = 'Arquivado'
          TabOrder = 1
        end
        object UniDateTimePicker3: TUniDateTimePicker
          Left = 8
          Top = 17
          Width = 97
          Height = 20
          Hint = ''
          DateTime = 42977.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
      end
      object Ctn_Agency: TUniContainerPanel
        Left = 4
        Top = 53
        Width = 325
        Height = 37
        Hint = ''
        ParentColor = False
        TabOrder = 9
      end
      object Ctn_Customer: TUniContainerPanel
        Left = 332
        Top = 53
        Width = 335
        Height = 37
        Hint = ''
        ParentColor = False
        TabOrder = 10
      end
      object UniEdit2: TUniEdit
        Left = 3
        Top = 111
        Width = 178
        Hint = ''
        Text = ''
        TabOrder = 11
      end
      object UniEdit3: TUniEdit
        Left = 183
        Top = 111
        Width = 256
        Hint = ''
        Text = ''
        TabOrder = 12
      end
      object UniEdit4: TUniEdit
        Left = 441
        Top = 111
        Width = 226
        Hint = ''
        Text = ''
        TabOrder = 13
      end
      object UniLabel4: TUniLabel
        Left = 4
        Top = 96
        Width = 39
        Height = 13
        Hint = ''
        Caption = 'Contato'
        TabOrder = 14
      end
      object UniLabel5: TUniLabel
        Left = 183
        Top = 96
        Width = 83
        Height = 13
        Hint = ''
        Caption = 'Fone/Celular/Fax'
        TabOrder = 15
      end
      object UniLabel6: TUniLabel
        Left = 441
        Top = 96
        Width = 24
        Height = 13
        Hint = ''
        Caption = 'Email'
        TabOrder = 16
      end
    end
    object UniPanel2: TUniPanel
      Left = 2
      Top = 145
      Width = 672
      Height = 253
      Hint = ''
      Align = alClient
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Caption = ''
      ExplicitLeft = 264
      ExplicitTop = 168
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniPageControl1: TUniPageControl
        Left = 3
        Top = 0
        Width = 664
        Height = 249
        Hint = ''
        ActivePage = UniTabSheet2
        TabOrder = 1
        object UniTabSheet1: TUniTabSheet
          Hint = ''
          Caption = 'Rela'#231#227'o de Op'#231#245'es e Divulga'#231#245'es'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 664
          ExplicitHeight = 193
          object UniPanel3: TUniPanel
            Left = 0
            Top = 3
            Width = 657
            Height = 223
            Hint = ''
            TabOrder = 0
            BorderStyle = ubsFrameLowered
            Caption = ''
            DesignSize = (
              657
              223)
            object UniDBGrid1: TUniDBGrid
              Left = 1
              Top = 1
              Width = 653
              Height = 174
              Hint = ''
              LoadMask.Message = 'Loading data...'
              TabOrder = 1
            end
            object UniSpeedButton1: TUniSpeedButton
              Left = 3
              Top = 179
              Width = 91
              Height = 37
              Hint = ''
              Caption = 'Novo'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              OnClick = SB_InsertClick
            end
            object UniSpeedButton2: TUniSpeedButton
              Left = 95
              Top = 179
              Width = 91
              Height = 37
              Hint = ''
              Caption = 'Alterar'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              OnClick = SB_InsertClick
            end
            object UniSpeedButton3: TUniSpeedButton
              Left = 187
              Top = 179
              Width = 91
              Height = 37
              Hint = ''
              Caption = 'Excluir'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              OnClick = SB_InsertClick
            end
            object UniSpeedButton4: TUniSpeedButton
              Left = 279
              Top = 179
              Width = 91
              Height = 37
              Hint = ''
              Caption = 'Gerar PJ'
              Anchors = [akLeft, akBottom]
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              ParentColor = False
              Color = clWindow
              IconAlign = iaTop
              OnClick = SB_InsertClick
            end
          end
        end
        object UniTabSheet2: TUniTabSheet
          Hint = ''
          Caption = 'Outras Informa'#231#245'es'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 664
          ExplicitHeight = 193
          object UniPanel4: TUniPanel
            Left = 3
            Top = 2
            Width = 650
            Height = 216
            Hint = ''
            TabOrder = 0
            BorderStyle = ubsFrameLowered
            Caption = ''
            object M_Obs: TUniMemo
              Left = 7
              Top = 22
              Width = 312
              Height = 191
              Hint = ''
              Lines.Strings = (
                'M_Obs')
              TabOrder = 1
            end
            object UniLabel7: TUniLabel
              Left = 7
              Top = 7
              Width = 58
              Height = 13
              Hint = ''
              Caption = 'Observa'#231#227'o'
              TabOrder = 2
            end
            object UniEdit5: TUniEdit
              Left = 325
              Top = 38
              Width = 308
              Hint = ''
              Text = ''
              TabOrder = 3
            end
            object UniLabel8: TUniLabel
              Left = 325
              Top = 22
              Width = 102
              Height = 13
              Hint = ''
              Caption = 'Forma de Pagamento'
              TabOrder = 4
            end
            object UniEdit6: TUniEdit
              Left = 325
              Top = 81
              Width = 308
              Hint = ''
              Text = ''
              TabOrder = 5
            end
            object UniLabel9: TUniLabel
              Left = 325
              Top = 66
              Width = 116
              Height = 13
              Hint = ''
              Caption = 'Respons'#225'vel/Assinatura'
              TabOrder = 6
            end
            object UniLabel10: TUniLabel
              Left = 325
              Top = 107
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'Email'
              TabOrder = 7
            end
            object UniEdit7: TUniEdit
              Left = 325
              Top = 122
              Width = 308
              Hint = ''
              Text = ''
              TabOrder = 8
            end
            object UniGroupBox2: TUniGroupBox
              Left = 325
              Top = 147
              Width = 235
              Height = 54
              Hint = ''
              Caption = ''
              TabOrder = 9
              object UniLabel11: TUniLabel
                Left = 3
                Top = 7
                Width = 51
                Height = 13
                Hint = ''
                Caption = 'Valor Total'
                TabOrder = 1
              end
              object UniEdit8: TUniEdit
                Left = 3
                Top = 31
                Width = 121
                Height = 20
                Hint = ''
                Text = ''
                TabOrder = 2
              end
              object UniCheckBox2: TUniCheckBox
                Left = 133
                Top = 32
                Width = 97
                Height = 17
                Hint = ''
                Caption = 'Ocultar Total'
                TabOrder = 3
              end
            end
          end
        end
      end
    end
  end
  inherited Menu: TUniMainMenu
    Left = 144
    Top = 64
  end
end
