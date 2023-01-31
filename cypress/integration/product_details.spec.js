describe('Jungle product detail page', () => {

  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000/products')
  })

  it("can navigate to product details page by clicking on alt element", () => {
    cy.get("[alt='Scented Blade']").click();

    cy.contains(".product-detail", "Scented Blade").should("exist");
  })


})