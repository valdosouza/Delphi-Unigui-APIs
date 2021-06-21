inherited CadAgency: TCadAgency
  Caption = 'Cadastro de Ag'#234'ncia de Publicidade'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    ExplicitWidth = 651
  end
  inherited pnl_fundo: TUniPanel
    ExplicitWidth = 651
    inherited pnl_fundo_linha_1: TUniPanel
      ExplicitWidth = 647
      inherited E_DateRegistry: TUniDateTimePicker
        Width = 83
        ExplicitWidth = 83
      end
      inherited E_DocFiscal: TUniEdit
        Left = 286
        ExplicitLeft = 286
      end
      inherited E_Ins_Mun: TUniEdit
        Left = 553
        Width = 140
        ExplicitLeft = 553
        ExplicitWidth = 91
      end
      inherited E_RG_InscEst: TUniEdit
        Left = 434
        ExplicitLeft = 434
      end
      inherited RG_Pessoa: TUniRadioGroup
        Left = 146
        ExplicitLeft = 146
      end
      inherited Sb_PesCNPJ: TUniSpeedButton
        Left = 405
        ExplicitLeft = 405
      end
    end
    inherited pnl_fundo_linha_2: TUniPanel
      ExplicitWidth = 647
      inherited E_NickTrade: TUniEdit
        ExplicitWidth = 327
      end
    end
    inherited pnl_fundo_linha_3: TUniPanel
      ExplicitWidth = 647
      inherited Ctn_LineBusiness: TUniContainerPanel
        ExplicitWidth = 543
      end
      inherited E_DtAniversary: TUniDateTimePicker
        DateFormat = 'dd/MM/yyyy'
        ExplicitLeft = 546
      end
    end
    inherited pnl_fundo_linha_4: TUniPanel
      ExplicitWidth = 647
      inherited E_WebSite: TUniEdit
        ExplicitWidth = 327
      end
    end
  end
  inherited Pg_Main: TUniPageControl
    ExplicitWidth = 651
    inherited tb_Address: TUniTabSheet
      ExplicitWidth = 643
      inherited Ctn_Address: TUniContainerPanel
        ExplicitWidth = 643
      end
    end
    inherited tb_Obs: TUniTabSheet
      ExplicitWidth = 643
      inherited E_Obs: TUniMemo
        ExplicitWidth = 637
      end
    end
    inherited tbs_tributacao: TUniTabSheet
      ExplicitWidth = 643
      inherited ChBx_OptanteSimples: TUniCheckBox
        ExplicitWidth = 637
      end
      inherited Chbx_IgnoraST: TUniCheckBox
        ExplicitWidth = 637
      end
      inherited Cb_Ind_IE_Dest: TUniComboBox
        ExplicitWidth = 637
      end
      inherited chbx_Just_Xml: TUniCheckBox
        ExplicitWidth = 637
      end
      inherited pnl_tributacai_linha_6: TUniPanel
        ExplicitWidth = 643
      end
      inherited pnl_tributacai_linha_7: TUniPanel
        ExplicitWidth = 643
      end
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitWidth = 643
      object Rg_CadastroAtivo: TUniRadioGroup
        Left = 3
        Top = 1
        Width = 118
        Height = 42
        Hint = ''
        Items.Strings = (
          'SIM'
          'N'#195'O')
        Caption = 'Cadastro Ativo'
        TabOrder = 0
        Columns = 2
      end
      object E_kickback: TUniFormattedNumberEdit
        Left = 126
        Top = 19
        Width = 74
        Hint = ''
        Alignment = taRightJustify
        TabOrder = 1
        DecimalSeparator = ','
        ThousandSeparator = '.'
      end
      object UniLabel13: TUniLabel
        Left = 201
        Top = 23
        Width = 11
        Height = 13
        Hint = ''
        Caption = '%'
        TabOrder = 2
      end
      object Lb_kickback: TUniLabel
        Left = 126
        Top = 4
        Width = 45
        Height = 13
        Hint = ''
        Caption = 'Comiss'#227'o'
        TabOrder = 3
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 400
    Top = 224
  end
  inherited ds_msg: TDataSource
    Left = 400
    Top = 280
  end
  inherited MenuTask: TUniMainMenu
    Left = 472
    Top = 224
  end
end
