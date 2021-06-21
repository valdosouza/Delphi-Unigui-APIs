inherited TasOrderStockAdjust: TTasOrderStockAdjust
  ClientHeight = 495
  Caption = 'Ordem Ajuste de Estoque'
  Menu = nil
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_botao: TUniPanel
    Top = 431
    ExplicitTop = 431
  end
  inherited pnl_fundo: TUniPanel
    Height = 431
    ExplicitHeight = 431
    object UniPanel1: TUniPanel
      Left = 2
      Top = 2
      Width = 771
      Height = 55
      Hint = ''
      Align = alTop
      TabOrder = 1
      BorderStyle = ubsFrameLowered
      Caption = ''
      object L_Codigo: TUniLabel
        Left = 5
        Top = 6
        Width = 44
        Height = 14
        Hint = ''
        Caption = 'N'#250'mero'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        TabOrder = 1
      end
      object E_Number: TUniEdit
        Left = 4
        Top = 21
        Width = 72
        Hint = ''
        Text = ''
        TabOrder = 2
        ReadOnly = True
      end
      object E_DateRegistry: TUniDateTimePicker
        Left = 79
        Top = 21
        Width = 99
        Hint = ''
        DateTime = 42544.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 3
      end
      object L_DtRegistry: TUniLabel
        Left = 79
        Top = 6
        Width = 69
        Height = 14
        Hint = ''
        Caption = 'Data Cadastro'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        TabOrder = 4
      end
      object Ctn_Entity_Fiscal: TUniContainerPanel
        Left = 183
        Top = 9
        Width = 567
        Height = 37
        Hint = ''
        ParentColor = False
        TabOrder = 5
      end
    end
    object pg_Items: TUniPageControl
      Left = 2
      Top = 57
      Width = 771
      Height = 372
      Hint = ''
      ActivePage = tbs_List
      Align = alClient
      TabOrder = 2
      object tbs_List: TUniTabSheet
        Hint = ''
        Caption = 'Lista de Mercadoria'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object pnl_Order_Item: TUniPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 344
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          object Ctn_Order_itens_StockAdjust: TUniContainerPanel
            Left = 2
            Top = 2
            Width = 759
            Height = 340
            Hint = ''
            ParentColor = False
            Align = alClient
            TabOrder = 1
          end
        end
      end
      object tbs_other: TUniTabSheet
        Hint = ''
        Caption = 'Outras Informa'#231#245'es'
        object UniPanel2: TUniPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 344
          Hint = ''
          Align = alClient
          TabOrder = 0
          BorderStyle = ubsFrameLowered
          Caption = ''
          DesignSize = (
            763
            344)
          object M_note: TUniMemo
            Left = 3
            Top = 19
            Width = 755
            Height = 106
            Hint = ''
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
          end
          object UniLabel13: TUniLabel
            Left = 6
            Top = 4
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
          object chbx_approved: TUniCheckBox
            Left = 6
            Top = 127
            Width = 85
            Height = 17
            Hint = ''
            Caption = 'Aprovado'
            TabOrder = 3
          end
        end
      end
      object tbs_delivery: TUniTabSheet
        Hint = ''
        Caption = 'Entrega'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 256
        ExplicitHeight = 128
        object Ctn_Shipping: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 763
          Height = 344
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
        end
      end
    end
  end
  inherited MenuTask: TUniMainMenu
    Left = 544
    inherited MnuTarefas: TUniMenuItem
      object NotaFiscal1: TUniMenuItem
        Caption = 'Nota Fiscal'
        OnClick = NotaFiscal1Click
      end
      object Copiaritens1: TUniMenuItem
        Caption = 'Copiar itens'
        OnClick = Copiaritens1Click
      end
    end
  end
end
