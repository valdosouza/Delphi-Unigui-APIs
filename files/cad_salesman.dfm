inherited CadSalesman: TCadSalesman
  ClientHeight = 475
  Caption = 'Cadastro de Vendedor'
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 411
    ExplicitTop = 411
  end
  inherited Pg_Main: TUniPageControl
    Height = 221
    ActivePage = tbs_tributacao
    ExplicitHeight = 221
    inherited tb_Address: TUniTabSheet
      ExplicitWidth = 637
      ExplicitHeight = 193
      inherited Ctn_Address: TUniContainerPanel
        Height = 193
        ExplicitHeight = 193
      end
    end
    inherited tb_Obs: TUniTabSheet
      ExplicitHeight = 193
      inherited E_Obs: TUniMemo
        Height = 187
        ExplicitHeight = 187
      end
    end
    inherited tbs_tributacao: TUniTabSheet
      ExplicitWidth = 637
      ExplicitHeight = 193
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitWidth = 637
      ExplicitHeight = 193
    end
    object tbs_comissao: TUniTabSheet
      Hint = ''
      Caption = 'Comiss'#227'o'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 256
      ExplicitHeight = 128
      object UniLabel12: TUniLabel
        Left = 9
        Top = 6
        Width = 104
        Height = 14
        Hint = ''
        Caption = 'Aliquota de Comiss'#227'o'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 0
      end
      object E_Aliq_Kickback: TUniEdit
        Left = 7
        Top = 21
        Width = 106
        Hint = ''
        MaxLength = 14
        Alignment = taRightJustify
        Text = ''
        TabOrder = 1
      end
      object Chbx_kickback_product: TUniCheckBox
        Left = 9
        Top = 49
        Width = 236
        Height = 17
        Hint = ''
        Caption = 'Recebe Comiss'#227'o por Produtos'
        TabOrder = 2
      end
      object E_Vl_Flex: TUniEdit
        Left = 119
        Top = 21
        Width = 86
        Hint = ''
        MaxLength = 14
        Alignment = taRightJustify
        Text = ''
        TabOrder = 3
      end
      object UniLabel14: TUniLabel
        Left = 121
        Top = 6
        Width = 48
        Height = 14
        Hint = ''
        Caption = 'Valor Flex'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 4
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    inherited MnuTarefas: TUniMenuItem
      object Usurio1: TUniMenuItem
        Caption = 'Usu'#225'rio'
        OnClick = Usurio1Click
      end
    end
  end
end
