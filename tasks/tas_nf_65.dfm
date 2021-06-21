inherited TasNf65: TTasNf65
  ClientHeight = 618
  ClientWidth = 634
  Caption = 'Nota Fiscal Eletr'#244'nica de Consumidor'
  ExplicitWidth = 650
  ExplicitHeight = 676
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 505
    Width = 634
  end
  inherited pnl_fundo: TUniPanel
    Top = 84
    Width = 634
    Height = 421
    TabOrder = 4
  end
  object UniPanel1: TUniPanel [2]
    Left = 0
    Top = 0
    Width = 634
    Height = 84
    Hint = ''
    Align = alTop
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    BorderStyle = ubsFrameLowered
    Caption = ''
    object UniLabel10: TUniLabel
      Left = 6
      Top = 2
      Width = 110
      Height = 14
      Hint = ''
      Caption = 'Natureza da Opera'#231#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_Desc_Cfop: TUniEdit
      Left = 4
      Top = 17
      Width = 379
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 2
      ReadOnly = True
    end
    object UniLabel11: TUniLabel
      Left = 384
      Top = 2
      Width = 27
      Height = 14
      Hint = ''
      Caption = 'CFOP'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object E_Cfop: TUniEdit
      Left = 384
      Top = 17
      Width = 58
      Hint = ''
      Text = ''
      TabOrder = 4
      ReadOnly = True
    end
    object UniLabel13: TUniLabel
      Left = 540
      Top = 2
      Width = 67
      Height = 14
      Hint = ''
      Caption = 'Nota Fiscal N'#176
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object E_Nr_Invoice: TUniEdit
      Left = 540
      Top = 17
      Width = 87
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 6
      ReadOnly = True
    end
    object UniLabel15: TUniLabel
      Left = 443
      Top = 2
      Width = 80
      Height = 14
      Hint = ''
      Caption = 'Data de Emiss'#227'o'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 7
    end
    object E_Dt_Emission: TUniEdit
      Left = 443
      Top = 17
      Width = 95
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 8
      ReadOnly = True
    end
    object UniLabel7: TUniLabel
      Left = 63
      Top = 40
      Width = 62
      Height = 14
      Hint = ''
      Caption = 'Raz'#227'o social'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 9
    end
    object E_Company: TUniEdit
      Left = 63
      Top = 54
      Width = 381
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 10
      ReadOnly = True
    end
    object UniLabel21: TUniLabel
      Left = 449
      Top = 40
      Width = 60
      Height = 14
      Hint = ''
      Caption = 'C.N.P.J/C.P.F'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 11
    end
    object E_Cnpj_Cpf: TUniEdit
      Left = 449
      Top = 54
      Width = 176
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 12
      ReadOnly = True
    end
    object UniLabel8: TUniLabel
      Left = 6
      Top = 40
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 13
    end
    object E_Cd_Company: TUniEdit
      Left = 4
      Top = 54
      Width = 58
      Hint = ''
      Text = ''
      TabOrder = 14
      ReadOnly = True
    end
  end
  object UniDBGrid1: TUniDBGrid [3]
    Left = 0
    Top = 84
    Width = 634
    Height = 421
    Hint = ''
    LoadMask.Message = 'Loading data...'
    Align = alClient
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 2
  end
  object UniPanel2: TUniPanel [4]
    Left = 0
    Top = 569
    Width = 634
    Height = 49
    Hint = ''
    Align = alBottom
    Anchors = [akLeft, akRight, akBottom]
    TabOrder = 3
    BorderStyle = ubsFrameLowered
    Caption = ''
    DesignSize = (
      634
      49)
    object UniLabel14: TUniLabel
      Left = 503
      Top = 5
      Width = 90
      Height = 14
      Hint = ''
      Caption = 'Valor Total da Nota'
      Anchors = [akRight, akBottom]
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_VL_Invoice: TUniEdit
      Left = 503
      Top = 21
      Width = 125
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      Anchors = [akRight, akBottom]
      TabOrder = 2
      ReadOnly = True
    end
  end
end
