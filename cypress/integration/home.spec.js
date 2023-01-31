describe('Jungle home page', () => {

  // beforeEach(() => {
  //   cy.visit('http://0.0.0.0:3000/products')
  // })

  it("can visit the home page", () => {
    cy.visit('http://0.0.0.0:3000')
  })

  it("There are products on the page", () => {
    cy.get(".products article").should("be.visible");
  })

  it("There are 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  })


})