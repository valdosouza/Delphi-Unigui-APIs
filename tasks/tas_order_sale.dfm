inherited TasOrderSale: TTasOrderSale
  ClientHeight = 545
  ClientWidth = 818
  Caption = 'Ordem de Venda'
  ExplicitWidth = 834
  ExplicitHeight = 604
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 481
    Width = 818
    ExplicitTop = 451
    ExplicitWidth = 752
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
  inherited pnl_fundo: TUniPanel
    Width = 818
    Height = 481
    ExplicitTop = 0
    ExplicitWidth = 752
    ExplicitHeight = 451
    object pnl_top: TUniPanel
      Left = 2
      Top = 2
      Width = 814
      Height = 118
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      object pnl_top_linha_01: TUniPanel
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 804
        Height = 52
        Hint = ''
        Margins.Bottom = 1
        Align = alTop
        TabOrder = 1
        BorderStyle = ubsNone
        Caption = ''
        ExplicitLeft = 2
        ExplicitTop = 2
        ExplicitWidth = 810
        object Ctn_Customer: TUniContainerPanel
          Left = 260
          Top = 0
          Width = 544
          Height = 52
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 263
          ExplicitTop = -6
          ExplicitWidth = 550
          ExplicitHeight = 49
        end
        object E_Number: TUniEdit
          AlignWithMargins = True
          Left = 3
          Top = 2
          Width = 102
          Height = 47
          Hint = ''
          Margins.Top = 2
          Text = ''
          Align = alLeft
          TabOrder = 2
          ReadOnly = True
          FieldLabel = 'N'#250'mero'
          FieldLabelAlign = laTop
          ExplicitHeight = 44
        end
        object E_DateRegistry: TUniDateTimePicker
          AlignWithMargins = True
          Left = 111
          Top = 2
          Width = 146
          Height = 47
          Hint = ''
          Margins.Top = 2
          DateTime = 42544.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          Align = alLeft
          TabOrder = 3
          FieldLabel = 'Data Cadastro'
          FieldLabelAlign = laTop
          ExplicitHeight = 44
        end
      end
      object pnl_top_linha_02: TUniPanel
        AlignWithMargins = True
        Left = 5
        Top = 59
        Width = 804
        Height = 52
        Hint = ''
        Margins.Top = 1
        Align = alTop
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        ExplicitLeft = 2
        ExplicitTop = 54
        ExplicitWidth = 810
        object Ctn_PaymentType: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 364
          Height = 52
          Hint = ''
          ParentColor = False
          Align = alLeft
          TabOrder = 1
        end
        object Ctn_SalesMan: TUniContainerPanel
          Left = 364
          Top = 0
          Width = 440
          Height = 52
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 2
          ExplicitWidth = 380
          ExplicitHeight = 49
        end
      end
    end
    object UniPageControl2: TUniPageControl
      Left = 2
      Top = 120
      Width = 814
      Height = 359
      Hint = ''
      ActivePage = tbs_List
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 5
      ExplicitTop = 176
      ExplicitWidth = 808
      ExplicitHeight = 270
      object tbs_List: TUniTabSheet
        Hint = ''
        Caption = 'Lista de Mercadoria'
        ExplicitWidth = 800
        ExplicitHeight = 242
        object Ctn_ItensSale: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 331
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 740
          ExplicitHeight = 316
        end
      end
      object tbs_other: TUniTabSheet
        Hint = ''
        Caption = 'Outras Informa'#231#245'es'
        ExplicitWidth = 800
        ExplicitHeight = 242
        DesignSize = (
          806
          331)
        object UniPanel1: TUniPanel
          Left = 0
          Top = 0
          Width = 806
          Height = 128
          Hint = ''
          Align = alTop
          TabOrder = 0
          BorderStyle = ubsNone
          Caption = ''
          ExplicitWidth = 740
          object UniPanel2: TUniPanel
            Left = 0
            Top = 0
            Width = 653
            Height = 128
            Hint = ''
            Align = alClient
            TabOrder = 1
            BorderStyle = ubsFrameLowered
            Caption = ''
            ExplicitWidth = 587
            object M_note: TUniMemo
              Left = 2
              Top = 20
              Width = 649
              Height = 106
              Hint = ''
              Align = alBottom
              TabOrder = 0
              ExplicitWidth = 583
            end
            object UniLabel13: TUniLabel
              Left = 2
              Top = 2
              Width = 83
              Height = 14
              Hint = ''
              Caption = 'Prazo de Entrega'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 2
            end
          end
          object UniPanel3: TUniPanel
            Left = 653
            Top = 0
            Width = 153
            Height = 128
            Hint = ''
            Align = alRight
            TabOrder = 2
            BorderStyle = ubsFrameLowered
            Caption = ''
            ExplicitLeft = 587
            object Rg_Freight_Owner: TUniRadioGroup
              Left = 2
              Top = 2
              Width = 149
              Height = 65
              Hint = ''
              Items.Strings = (
                'Remetente  - CIF'
                'Destinat'#225'rio - FOB')
              Align = alTop
              Caption = 'Frete por Conta'
              TabOrder = 1
            end
            object L_DeadLine: TUniLabel
              Left = 6
              Top = 67
              Width = 83
              Height = 14
              Hint = ''
              Caption = 'Prazo de Entrega'
              ParentFont = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Name = 'Arial'
              TabOrder = 4
            end
            object E_DeliveryDate: TUniEdit
              Left = 6
              Top = 82
              Width = 88
              Hint = ''
              Text = ''
              TabOrder = 2
            end
            object chbx_approved: TUniCheckBox
              Left = 6
              Top = 106
              Width = 85
              Height = 17
              Hint = ''
              Caption = 'Aprovado'
              TabOrder = 3
            end
          end
        end
        object Ctn_Installment_open: TUniContainerPanel
          Left = 2
          Top = 130
          Width = 445
          Height = 52
          Hint = ''
          ParentColor = False
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 480
    Top = 280
    inherited MnuTarefas: TUniMenuItem
      object Configurao1: TUniMenuItem
        Caption = 'Configura'#231#227'o'
        OnClick = Configurao1Click
      end
      object Copiaritens1: TUniMenuItem
        Caption = 'Copiar itens'
        OnClick = Copiaritens1Click
      end
    end
  end
end
