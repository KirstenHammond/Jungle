describe('Jungle add to cart', () => {

  beforeEach(() => {
    cy.visit('http://0.0.0.0:3000/products')
  })

  it("increases the cart number by one when 'add to cart' is clicked", () => {
    cy.get('button.btn').click({force: true, multiple: true});
    cy.get('#shopping-cart').contains('1');
  })


})