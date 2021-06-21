inherited PrintProduct: TPrintProduct
  ClientHeight = 236
  ClientWidth = 598
  Caption = 'Relat'#243'rio de Produtos'
  ExplicitWidth = 604
  ExplicitHeight = 285
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnl_Botao: TUniPanel
    Top = 170
    Width = 598
    ExplicitTop = 170
    ExplicitWidth = 598
  end
  inherited pnl_Lista: TUniPanel
    Height = 170
    ExplicitHeight = 170
    inherited Lbx_reports: TUniListBox
      Height = 153
      Items.Strings = (
        'CADASTRO')
      ExplicitHeight = 153
    end
  end
  inherited Parâmetros: TUniGroupBox
    Width = 429
    Height = 170
    ExplicitWidth = 429
    ExplicitHeight = 170
    object ctn_Category: TUniContainerPanel
      Left = 6
      Top = 15
      Width = 413
      Height = 41
      Hint = ''
      ParentColor = False
      TabOrder = 1
    end
    object Ctn_Stock_Id_Ori: TUniContainerPanel
      Left = 6
      Top = 58
      Width = 413
      Height = 41
      Hint = ''
      Visible = False
      ParentColor = False
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
    end
  end
end
