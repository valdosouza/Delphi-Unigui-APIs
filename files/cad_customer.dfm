inherited CadCustomer: TCadCustomer
  Caption = 'Cadastro de Clientes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    inherited SB_Insert: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Change: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited SB_Save: TUniSpeedButton
      ExplicitTop = 5
    end
    inherited Sb_Close: TUniSpeedButton
      ExplicitTop = 5
    end
  end
  inherited Pg_Main: TUniPageControl
    inherited tbs_tributacao: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 692
      ExplicitHeight = 240
      inherited ChBx_OptanteSimples: TUniCheckBox
        Top = 20
        Margins.Top = 0
        TabOrder = 1
        ExplicitTop = 20
      end
      inherited Chbx_IgnoraST: TUniCheckBox
        Top = 37
        TabOrder = 2
        ExplicitTop = 37
      end
      inherited UniLabel1: TUniLabel
        Top = 74
        TabOrder = 7
        ExplicitTop = 74
      end
      inherited Cb_Ind_IE_Dest: TUniComboBox
        Top = 93
        TabOrder = 4
        ExplicitTop = 93
      end
      inherited chbx_Just_Xml: TUniCheckBox
        Top = 54
        TabOrder = 3
        ExplicitTop = 54
      end
      inherited pnl_tributacai_linha_6: TUniPanel
        Top = 118
        ExplicitTop = 118
      end
      inherited pnl_tributacai_linha_7: TUniPanel
        Top = 165
        ExplicitTop = 165
      end
      object chbx_Consumidor: TUniCheckBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 686
        Height = 17
        Hint = ''
        Margins.Bottom = 0
        Caption = 'Consumidor Final'
        Align = alTop
        TabOrder = 0
      end
    end
    inherited tbs_OutrasInfo: TUniTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 692
      ExplicitHeight = 240
      object Ctn_Salesman: TUniContainerPanel
        Left = 0
        Top = 156
        Width = 692
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 0
      end
      object Ctn_Carrier: TUniContainerPanel
        Left = 0
        Top = 104
        Width = 692
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 1
      end
      object pnl_other_row_1: TUniPanel
        Left = 0
        Top = 0
        Width = 692
        Height = 52
        Hint = ''
        Align = alTop
        TabOrder = 2
        Caption = ''
        object Rg_SituacaoCredito: TUniRadioGroup
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 180
          Height = 44
          Hint = ''
          Items.Strings = (
            'LIBERADO'
            'BLOQUEADO')
          Align = alLeft
          Caption = 'Situa'#231#227'o do Cr'#233'dito'
          TabOrder = 1
          Columns = 2
        end
        object Rg_HabilitaCarteira: TUniRadioGroup
          AlignWithMargins = True
          Left = 190
          Top = 4
          Width = 118
          Height = 44
          Hint = ''
          Items.Strings = (
            'SIM'
            'N'#195'O')
          Align = alLeft
          Caption = 'Habilitar Carteira'
          TabOrder = 2
          Columns = 2
        end
        object Rg_CadastroAtivo: TUniRadioGroup
          AlignWithMargins = True
          Left = 314
          Top = 4
          Width = 118
          Height = 44
          Hint = ''
          Items.Strings = (
            'SIM'
            'N'#195'O')
          Align = alLeft
          Caption = 'Cadastro Ativo'
          TabOrder = 3
          Columns = 2
        end
      end
      object pnl_other_row_2: TUniPanel
        Left = 0
        Top = 52
        Width = 692
        Height = 52
        Hint = ''
        Align = alTop
        TabOrder = 3
        Caption = ''
        object E_VL_Credito: TUniEdit
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 119
          Height = 39
          Hint = ''
          Margins.Bottom = 8
          MaxLength = 14
          Alignment = taRightJustify
          Text = ''
          Align = alLeft
          TabOrder = 1
          FieldLabel = 'Limite de Cr'#233'dito'
          FieldLabelAlign = laTop
        end
        object E_Multiplicador: TUniEdit
          AlignWithMargins = True
          Left = 129
          Top = 4
          Width = 112
          Height = 39
          Hint = ''
          Margins.Bottom = 8
          MaxLength = 14
          Alignment = taRightJustify
          Text = ''
          Align = alLeft
          TabOrder = 2
          FieldLabel = 'Multiplicador'
          FieldLabelAlign = laTop
        end
      end
    end
  end
  inherited cds_msg: TClientDataSet
    Left = 24
    Top = 8
  end
  inherited ds_msg: TDataSource
    Left = 24
    Top = 8
  end
  inherited MenuTask: TUniMainMenu
    Left = 24
    Top = 8
  end
end
