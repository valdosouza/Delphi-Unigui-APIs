inherited CadFinancialEdit: TCadFinancialEdit
  ClientHeight = 368
  ClientWidth = 338
  Caption = 'Edi'#231#227'o do Financeiro'
  BorderStyle = bsSingle
  BorderIcons = [biSystemMenu]
  ExplicitWidth = 344
  ExplicitHeight = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 304
    Width = 338
    ExplicitTop = 291
    ExplicitWidth = 339
    inherited SB_Insert: TUniSpeedButton
      Left = 284
      Width = 30
      Visible = False
      ExplicitLeft = 284
      ExplicitWidth = 30
    end
    inherited SB_Change: TUniSpeedButton
      Left = 251
      Width = 30
      Visible = False
      ExplicitLeft = 251
      ExplicitWidth = 30
    end
    inherited SB_Delete: TUniSpeedButton
      Left = 221
      Width = 30
      Visible = False
      ExplicitLeft = 221
      ExplicitWidth = 30
    end
    inherited SB_Save: TUniSpeedButton
      Left = 5
      Margins.Left = 3
      ExplicitLeft = 5
    end
    inherited SB_Cancel: TUniSpeedButton
      Left = 98
      ExplicitLeft = 98
    end
    inherited Sb_Close: TUniSpeedButton
      Left = 191
      Width = 30
      Visible = False
      ExplicitLeft = 191
      ExplicitTop = 5
      ExplicitWidth = 30
    end
  end
  inherited pnl_fundo: TUniPanel
    Width = 338
    Height = 304
    ExplicitTop = -1
    ExplicitWidth = 338
    ExplicitHeight = 304
    object UniLabel2: TUniLabel
      Left = 6
      Top = 4
      Width = 84
      Height = 13
      Hint = ''
      Caption = 'Data Lan'#231'amento'
      TabOrder = 1
    end
    object Dtp_Emission: TUniDateTimePicker
      Left = 6
      Top = 20
      Width = 100
      Hint = ''
      DateTime = 42979.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      ReadOnly = True
      TabOrder = 2
      ParentColor = True
    end
    object E_Nr_Doc: TUniEdit
      Left = 110
      Top = 20
      Width = 116
      Hint = ''
      Text = ''
      TabOrder = 3
      ReadOnly = True
    end
    object UniLabel1: TUniLabel
      Left = 112
      Top = 5
      Width = 110
      Height = 13
      Hint = ''
      Caption = 'Nota Fiscal/Documento'
      TabOrder = 4
    end
    object UniLabel3: TUniLabel
      Left = 228
      Top = 5
      Width = 89
      Height = 13
      Hint = ''
      Caption = 'Modelo Nota Fiscal'
      TabOrder = 5
    end
    object E_Mod_Doc: TUniEdit
      Left = 228
      Top = 20
      Width = 102
      Hint = ''
      Text = ''
      TabOrder = 6
      ReadOnly = True
    end
    object UniLabel4: TUniLabel
      Left = 6
      Top = 45
      Width = 79
      Height = 13
      Hint = ''
      Caption = 'S'#233'rie Nota Fiscal'
      TabOrder = 7
    end
    object E_Doc_Serie: TUniEdit
      Left = 6
      Top = 60
      Width = 102
      Hint = ''
      Text = ''
      TabOrder = 8
      Color = clWhite
      ReadOnly = True
    end
    object Lb_VL_Doc: TUniLabel
      Left = 112
      Top = 45
      Width = 96
      Height = 13
      Hint = ''
      Caption = 'Valor do Documento'
      TabOrder = 9
    end
    object E_VL_Doc: TUniNumberEdit
      Left = 112
      Top = 60
      Width = 100
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 10
      ReadOnly = True
      DecimalSeparator = ','
    end
    object Dtp_Expiration: TUniDateTimePicker
      Left = 122
      Top = 260
      Width = 100
      Hint = ''
      DateTime = 43014.000000000000000000
      DateFormat = 'dd/MM/yyyy'
      TimeFormat = 'HH:mm:ss'
      TabOrder = 11
    end
    object E_Vl_Parcela: TUniNumberEdit
      Left = 6
      Top = 260
      Width = 110
      Hint = ''
      Alignment = taRightJustify
      TabOrder = 12
      Color = clWhite
      DecimalUseOSDefault = True
    end
    object UniLabel5: TUniLabel
      Left = 122
      Top = 245
      Width = 96
      Height = 13
      Hint = ''
      Caption = 'Data de Vencimento'
      TabOrder = 13
    end
    object UniLabel6: TUniLabel
      Left = 6
      Top = 245
      Width = 77
      Height = 13
      Hint = ''
      Caption = 'Valor da Parcela'
      TabOrder = 14
    end
    object E_Nr_Parcela: TUniNumberEdit
      Left = 218
      Top = 60
      Width = 39
      Hint = ''
      TabOrder = 15
      DecimalSeparator = ','
    end
    object UniLabel7: TUniLabel
      Left = 218
      Top = 45
      Width = 35
      Height = 13
      Hint = ''
      Caption = 'Parcela'
      TabOrder = 16
    end
    object Ctn_PaymentType: TUniContainerPanel
      Left = 6
      Top = 203
      Width = 326
      Height = 37
      Hint = ''
      ParentColor = False
      TabOrder = 17
    end
    object m_note: TUniMemo
      Left = 6
      Top = 102
      Width = 325
      Height = 97
      Hint = ''
      ReadOnly = True
      Color = clWhite
      TabOrder = 18
    end
    object UniLabel8: TUniLabel
      Left = 6
      Top = 86
      Width = 58
      Height = 13
      Hint = ''
      Caption = 'Observa'#231#227'o'
      TabOrder = 19
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 376
  end
  inherited ds_msg: TDataSource
    Left = 376
    Top = 88
  end
  inherited MenuTask: TUniMainMenu
    Left = 248
    Top = 224
    inherited MnuTarefas: TUniMenuItem
      object Sair1: TUniMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
  end
end
