inherited CadCollaborator: TCadCollaborator
  ClientHeight = 483
  Caption = 'Cadastro de Colaborador'
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 419
    ExplicitTop = 419
  end
  inherited pnl_fundo: TUniPanel
    inherited pnl_fundo_linha_3: TUniPanel
      ExplicitWidth = 696
      inherited E_DtAniversary: TUniDateTimePicker
        ExplicitLeft = 595
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    Height = 210
    ExplicitHeight = 210
    inherited tb_Address: TUniTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 182
      inherited Ctn_Address: TUniContainerPanel
        Height = 182
        ExplicitHeight = 182
      end
    end
    inherited tb_Obs: TUniTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 182
      inherited E_Obs: TUniMemo
        Height = 176
        ExplicitWidth = 686
        ExplicitHeight = 176
      end
    end
    inherited tbs_tributacao: TUniTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 182
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitWidth = 692
      ExplicitHeight = 182
      object UniLabel4: TUniLabel
        Left = 3
        Top = 2
        Width = 59
        Height = 14
        Hint = ''
        Caption = 'Nome do pai'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 11
      end
      object E_Father: TUniEdit
        Left = 4
        Top = 15
        Width = 308
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 0
        OnChange = E_emailChange
      end
      object UniLabel5: TUniLabel
        Left = 314
        Top = 2
        Width = 65
        Height = 14
        Hint = ''
        Caption = 'Nome do M'#227'e'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 12
      end
      object E_Mother: TUniEdit
        Left = 314
        Top = 15
        Width = 308
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 1
        OnChange = E_emailChange
      end
      object UniLabel6: TUniLabel
        Left = 3
        Top = 40
        Width = 82
        Height = 14
        Hint = ''
        Caption = 'Certificado Militar'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 13
      end
      object E_military: TUniEdit
        Left = 3
        Top = 55
        Width = 268
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 2
        OnChange = E_emailChange
      end
      object UniLabel7: TUniLabel
        Left = 3
        Top = 77
        Width = 90
        Height = 14
        Hint = ''
        Caption = 'Salario/Pro-Labore'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 14
      end
      object E_Salary: TUniEdit
        Left = 3
        Top = 92
        Width = 146
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 6
        OnChange = E_emailChange
      end
      object UniLabel8: TUniLabel
        Left = 274
        Top = 40
        Width = 72
        Height = 14
        Hint = ''
        Caption = 'Titulo de Eleitor'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 15
      end
      object E_title: TUniEdit
        Left = 273
        Top = 55
        Width = 197
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 3
        OnChange = E_emailChange
      end
      object UniLabel9: TUniLabel
        Left = 476
        Top = 40
        Width = 25
        Height = 14
        Hint = ''
        Caption = 'Zona'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 16
      end
      object E_zone: TUniEdit
        Left = 476
        Top = 55
        Width = 83
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 4
        OnChange = E_emailChange
      end
      object UniLabel10: TUniLabel
        Left = 562
        Top = 40
        Width = 37
        Height = 14
        Hint = ''
        Caption = 'Sess'#227'o'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 17
      end
      object E_secção: TUniEdit
        Left = 562
        Top = 55
        Width = 64
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 5
        OnChange = E_emailChange
      end
      object UniLabel11: TUniLabel
        Left = 152
        Top = 77
        Width = 14
        Height = 14
        Hint = ''
        Caption = 'Pis'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 18
      end
      object E_Pis: TUniEdit
        Left = 152
        Top = 92
        Width = 146
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        ParentFont = False
        TabOrder = 7
        OnChange = E_emailChange
      end
      object l_date_adm: TUniLabel
        Left = 301
        Top = 77
        Width = 66
        Height = 14
        Hint = ''
        Caption = 'Data Admi'#231#227'o'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 19
      end
      object UniLabel13: TUniLabel
        Left = 394
        Top = 77
        Width = 72
        Height = 14
        Hint = ''
        Caption = 'Data Demiss'#227'o'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 20
      end
      object Dt_adm: TUniDateTimePicker
        Left = 301
        Top = 92
        Width = 88
        Hint = ''
        DateTime = 42941.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 8
      end
      object Dt_Dem: TUniDateTimePicker
        Left = 394
        Top = 92
        Width = 88
        Hint = ''
        DateTime = 42941.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 9
      end
      object Rg_CadastroAtivo: TUniRadioGroup
        Left = 488
        Top = 83
        Width = 130
        Height = 42
        Hint = ''
        Items.Strings = (
          'SIM'
          'N'#195'O')
        Caption = 'Cadastro Ativo'
        TabOrder = 10
        Columns = 2
      end
    end
  end
end
